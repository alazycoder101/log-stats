require 'spec_helper'
describe CLI do
  describe '#run' do
    context 'without arguments' do
      it 'should print help' do
        expect do
          CLI.run
        end.to output(a_string_including('Usage:')).to_stdout
      end
    end
  end

  describe '#version' do
    it 'shoud return the version' do
      expect(CLI.version).to eq('0.0.1')
    end
  end
end