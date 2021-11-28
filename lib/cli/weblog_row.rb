# frozen_string_literal: true

require_relative 'row'
require_relative 'validator'
module CLI
  # WeblogRow: row in web log file
  class WeblogRow < Row
    FIELDS = %i[path origin].freeze

    def valid?
      fields.each_with_index do |field, index|
        begin
          field_name = FIELDS[index]
          class_name = "#{field_name.capitalize}Validator"
          validator_class = Object.const_get(class_name)
        rescue NameError
          validator_class = Validator
        end
        validator = validator_class.validate(field)
        return false unless validator.valid
      end

      true
    end
  end
end
