# frozen_string_literal: true

require_relative 'validator'
module CLI
  # Validator: validate input
  class PathValidator < Validator
    def validate
      begin
        URI.parse(@input)
      rescue URI::InvalidURIError
        @errors << 'Invalid path'
      end
      super
      @valid = @errors.empty?
    end
  end
end
