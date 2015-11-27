require 'date'

module ActiveModel
  module Validations
    class DateValidator < EachValidator
      def validate_each(record, attribute, value)
        begin
          Date.parse(value)
        rescue
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
