module ActiveModel
  module Validations
    class KatakanaValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value =~ /\A[\p{katakana}ー－]*\z/i
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
