# frozen_string_literal: true

require_relative 'row'
require_relative 'validator'
module CLI
  # WeblogRow: row in web log file
  class WeblogRow < Row
    FIELDS = %i[path origin].freeze

    def valid?
      fields.each_with_index do |_field, index|
        validator = validator_class.validate(FIELDS[index])
        return false unless validator.valid
      end

      true
    end

    def validator_class(field_name)
      class_name = "#{field_name.capitalize}Validator"
      Object.const_get(class_name)
    rescue NameError
      Validator
    end
  end
end
