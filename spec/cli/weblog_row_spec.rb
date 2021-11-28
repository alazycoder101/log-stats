# frozen_string_literal: true

require 'spec_helper'
describe CLI::WeblogRow do
  describe 'FIELDS' do
    it 'should specify path and origin' do
      expect(CLI::WeblogRow::FIELDS).to eql(%i[path origin])
    end
  end

  describe 'valid?' do
    it 'should call validator' do
      row = CLI::WeblogRow.new('/path', '1.1.1.1')
      expect(row.valid?).to be true
    end
  end
end
