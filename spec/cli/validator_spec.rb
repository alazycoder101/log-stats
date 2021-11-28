# frozen_string_literal: true

require 'spec_helper'
describe CLI::Validator do
  describe '#validate' do
    it 'should return validate object' do
      rtn = CLI::Validator.validate('/path')
      expect(rtn).to be_a CLI::Validator
    end
  end

  describe 'initialize' do
    it 'should create a new Validator object' do
      validator = CLI::Validator.new('')
      expect(validator).to be_a CLI::Validator
    end

    it 'should check empty' do
      validator = CLI::Validator.new('')
      expect(validator.valid).to be_falsey
    end
  end
end
