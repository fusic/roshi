module ActiveModel
  module Validations
    class ZipCodeValidator < EachValidator
      REGEXES = {
        default: /\A\d{3}\-?\d{4}\z/i,
        with_hiphenation: /\A\d{3}\-\d{4}\z/i,
        without_hiphenation: /\A\d{7}\z/i
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
