# frozen_string_literal: true

require 'spec_helper'
describe CLI::Parser do
  let(:counter) { double('Counter', count: nil) }

  before do
    allow(counter).to receive(:count)
  end

  describe 'initialize' do
    it 'should create a new Parser object' do
      parser = CLI::Parser.new('spec/fixtures/webserver.log')
      expect(parser).to be_a CLI::Parser
    end
  end

  describe '#parse' do
    it 'should parse a log file' do
      CLI::Parser.parse('spec/fixtures/one.log', counter)
      expect(counter).to have_received(:count).with("/help_page/1 126.318.035.038\n")
    end
  end
end
