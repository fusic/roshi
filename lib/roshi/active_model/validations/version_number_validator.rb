module ActiveModel
  module Validations
    class VersionNumberValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value =~ /\A(\d+\.)?(\d+\.)?(\*|\d+)\z/i
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
