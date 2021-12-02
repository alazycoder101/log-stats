# frozen_string_literal: true

require 'spec_helper'
describe CLI::Parser do
  describe 'initialize' do
    it 'should create a new Parser object' do
      parser = CLI::Parser.new('spec/fixtures/webserver.log')
      expect(parser).to be_a CLI::Parser
    end
  end

  describe '#parse' do
    it 'should parse a log file' do
      rows = CLI::Parser.parse('spec/fixtures/webserver.log')
      expect(rows).to be_a Array
      expect(rows.first).to be_a CLI::Row
    end
  end
end
