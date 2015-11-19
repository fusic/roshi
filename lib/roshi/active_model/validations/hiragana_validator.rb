module ActiveModel
  module Validations
    class HiraganaValidator < EachValidator
      def validate_each(record, attribute, value)
        unless value =~ /\A[\p{hiragana}ー－]*\z/i
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
