module ActiveModel
  module Validations
    class HiraganaValidator < EachValidator
      def validate_each(record, attribute, value)
        space = options[:allow_space] ? '[:blank:]' : ''
        unless value =~ /\A[\p{hiragana}#{space}ー－]*\z/i
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
