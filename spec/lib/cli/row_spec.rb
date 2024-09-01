# frozen_string_literal: true

require 'spec_helper'
describe CLI::Row do
  describe 'initialize' do
    it 'should create a new Row object' do
      row = CLI::Row.new('a b')
      expect(row).to be_a CLI::Row
    end

    it 'should create with fields' do
      row = CLI::Row.new('/a/b 192.168.0.1')
      expect(row.fields).to eql(['/a/b', '192.168.0.1'])
    end

    it 'should create with fields when passing array' do
      row = CLI::Row.new([1, 2])
      expect(row.fields).to eql([1, 2])
    end
  end
end
