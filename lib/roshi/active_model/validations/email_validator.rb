module ActiveModel
  module Validations
    class EmailValidator < EachValidator
      def validate_each(record, attribute, value)
        # http://emailregex.com
        unless value =~ /\A([\w+!#$%&'*+\/=?^`{|}~\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
          record.errors.add(attribute, options[:message] || I18n.t('errors.messages.invalid'))
        end
      end
    end
  end
end
