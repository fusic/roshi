module ActiveModel
  module Validations
    class ZipCodeValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value =~ /\A\d{3}\-?\d{4}\z/i
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
