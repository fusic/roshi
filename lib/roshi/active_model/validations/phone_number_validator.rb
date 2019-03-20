module ActiveModel
  module Validations
    class PhoneNumberValidator < EachValidator
      REGEXES = {
        default: /\A0\d{1,4}\-?\d{1,4}\-?\d{1,4}\z/i,
        with_hiphenation: /\A0\d{1,4}\-\d{1,4}\-\d{1,4}\z/i,
        without_hiphenation: /\A0\d{9,10}\z/i
      }

      def validate_each(record, attribute, value)
        regexp = case
                 when options[:hiphenation].nil?
                   REGEXES[:default]
                 when options[:hiphenation]
                   REGEXES[:with_hiphenation]
                 when options[:hiphenation] == false
                   REGEXES[:without_hiphenation]
                 end
        valid_length = [10, 11].include?((value.gsub('-', '').length))
        unless value =~ regexp && valid_length
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
