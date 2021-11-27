# frozen_string_literal: true

require 'spec_helper'
describe CLI::Row do
  describe 'initialize' do
    it 'should create a new Row object' do
      row = CLI::Row.new
      expect(row).to be_a CLI::Row
    end

    it 'should create with fields' do
      row = CLI::Row.new(1, 2)
      expect(row.fields).to eql([1, 2])
    end

    it 'should create with fields when passing array' do
      row = CLI::Row.new([1, 2])
      expect(row.fields).to eql([1, 2])
    end
  end
end
