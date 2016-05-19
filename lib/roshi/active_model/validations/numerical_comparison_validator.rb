module ActiveModel
  module Validations
    class NumericalComparisonValidator < EachValidator
      def validate_each(record, attribute, value)
        # null check
        unless value.present?
          record.errors.add(attribute, :blank)
          return false
        end

        # check if value is numerical value
        unless value.is_a?(Numeric)
          record.errors.add(attribute, :not_a_number)
          return false
        end

        keys = options.keys

        # operators(>, >=, ==, <=, <) processings
        check_valid =  proc.new do |type, op|
          compare_to = options[type]
          compare_value = record.send(options[type])

          unless compare_value.present?
            record.errors.add(compare_to, :blank)
            return false
          end
          unless compare_value.is_a?(Numeric)
            record.errors.add(attribute, :not_a_number)
            return false
          end

          unless value.send(op, compare_value)
            record.errors.add(
              attribute,
              "must_be_#{type}".to_sym,
              min_field: record.class.human_attribute_name(compare_to)
            )
            return false
          end
        end

        # validate operations(>, >=, ==, <=, <)
        {
          greater_than: :>,
          greater_than_or_equal_to: :>=,
          equal_to: :==,
          less_than_or_equal_to: :<=,
          less_than: :<
        }.each do |k, v|
          check_valid.call(k, v) if keys.include? k
        end

        # validate between
        if keys.include? :between
          between_hash = options[:between]
          min_value_name = between_hash[:min]
          max_value_name = between_hash[:max]
          min_value = record.send(min_value_name)
          max_value = record.send(max_value_name)

          unless max_value.present? && min_value.present?
            record.errors.add(max_value_name, :blank) unless max_value.present?
            record.errors.add(min_value_name, :blank) unless min_value.present?
            return false
          end

          unless (min_value..max_value).cover? value
            record.errors.add(
              attribute,
              :must_be_in_range,
              min_field: record.class.human_attribute_name(min_value_name),
              max_field: record.class.human_attribute_name(max_value_name)
            )
            return false
          end
        end
      end
    end
  end
end
