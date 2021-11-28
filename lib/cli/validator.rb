# frozen_string_literal: true

module CLI
  # Validator: validate input
  class Validator
    attr_accessor :input, :errors, :valid

    def self.validate(input)
      Validator.new(input).validate
    end

    def initialize(input)
      @input = input
      @errors = []
      @valid = false
    end

    def validate
      @errors << 'Input must be a string' unless @input.is_a?(String)
      @errors << 'Input cannot be empty' if @input.empty?
      @valid = @errors.empty?
      self
    end
  end
end
