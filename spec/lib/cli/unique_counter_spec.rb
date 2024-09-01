# frozen_string_literal: true

require 'spec_helper'
describe CLI::UniqueCounter do
  subject(:counter) { described_class.new }

  let(:rows) do
    [
      CLI::Row.new('/help_page/1 126.318.035.038'),
      CLI::Row.new('/contact 184.123.665.067'),
      CLI::Row.new('/home 184.123.665.067'),
      CLI::Row.new('/about/2 444.701.448.104'),
      CLI::Row.new('/help_page/1 929.398.951.889'),
      CLI::Row.new('/help_page/1 126.318.035.038'),
      CLI::Row.new('/help_page/1 722.247.931.582')
    ]
  end

  describe '.new' do
    it 'should create a new Counter object' do
      expect(counter).to be_a described_class
    end

    it 'should create a empty stats' do
      expect(counter.stats).to eq({})
    end
  end

  describe '#count' do
    it 'increments visits' do
      expect { counter.count(rows[0]) }.to change {
        counter.stats
      }.from({}).to('/help_page/1' => { count: 1, ips: { '126.318.035.038' => 1 } })
      expect { counter.count(rows[0]) }.to change {
        counter.stats
      }.to('/help_page/1' => { count: 1, ips: { '126.318.035.038' => 2 } })
    end
  end
end
