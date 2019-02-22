module ActiveModel
  module Validations
    class PhoneNumberValidator < EachValidator
      REGEXES = {
        default: /\A\d{2,4}\-?\d{2,4}\-?\d{3,4}\z/i,
        with_hiphenation: /\A\d{2,4}\-\d{2,4}\-\d{3,4}\z/i,
        without_hiphenation: /\A\d{6,12}\z/i
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

        unless value =~ regexp
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
