# frozen_string_literal: true

require 'spec_helper'
describe CLI::PathValidator do
  describe '.validate' do
    it 'should return true' do
      validator = CLI::PathValidator.new('/path')
      validator.validate
      expect(validator.valid).to be_truthy
    end

    it 'should return false for empty' do
      validator = CLI::PathValidator.new('')
      validator.validate
      expect(validator.errors.first).to equal('Input cannot be empty')
    end

    it 'should return false for wrong path' do
      validator = CLI::PathValidator.new('\a')
      validator.validate
      expect(validator.errors.first).to equal('Invalid path')
    end
  end
end
