require 'spec_helper'
describe CLI::Row do
  describe 'initialize' do
    it 'should create a new Row object' do
      row = CLI::Row.new
      expect(row).to be_a CLI::Row
    end
  end
end