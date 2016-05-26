module ActiveModel
  module Validations
    class AvailableWordValidator < EachValidator
      def validate_each(record, attribute, value)
        accept_words = options[:accept_words] || []
        reject_words = options[:reject_words] || []

        if !(accept_words.empty? || accept_words.include?(value)) \
           || reject_words.include?(value)
          record.errors.add(attribute, options[:message] || :reject_word)
        end
      end
    end
  end
end
