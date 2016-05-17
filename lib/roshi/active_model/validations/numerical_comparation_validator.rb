module ActiveModel
  module Validations
    class NumericalComparationValidator < EachValidator
      def validate_each(record, attribute, value)
        compare_value = nil
        compare_to = options[:compare_to]
        if options[:type] == :between
          min_value = record.send(compare_to[:min])
          max_value = record.send(compare_to[:max])
          compare_value = min_value..max_value
        else
          compare_value = record.send(compare_to)
        end

        # check if value is numerical value
        return unless value.is_a?(Numeric)

        case options[:type]
        when :greater_than then
          unless value > compare_value
            record.errors.add(
              attribute,
              :must_be_greater_than,
              min_field: record.class.human_attribute_name(compare_to),
            )
            return false
          end
        when :greater_than_or_equal_to then
          unless value >= compare_value
            record.errors.add(
              attribute,
              :must_be_greater_than_or_equal_to,
              min_field: record.class.human_attribute_name(compare_to),
            )
            return false
          end
        when :equal_to then
          unless value == compare_value
            record.errors.add(
              attribute,
              :must_be_equal_to,
              min_field: record.class.human_attribute_name(compare_to),
            )
            return false
          end
        when :less_than_or_equal_to then
          unless value <= compare_value
            record.errors.add(
              attribute,
              :must_be_less_than_or_equal_to,
              min_field: record.class.human_attribute_name(compare_to),
            )
            return false
          end
        when :less_than then
          unless value < compare_value
            record.errors.add(
              attribute,
              :must_be_less_than,
              min_field: record.class.human_attribute_name(compare_to),
            )
            return false
          end
        when :between then
          unless compare_value.include? value
            record.errors.add(
              attribute,
              :must_be_in_range,
              min_field: record.class.human_attribute_name(compare_to[:min]),
              max_field: record.class.human_attribute_name(compare_to[:max]),
            )
            return false
          end
        end
        true
      end
    end
  end
end
