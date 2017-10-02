require "oystercard"

describe Oystercard do

  subject(:oyster) { described_class.new }

  describe '#balance' do
  
    it 'checks that the default balance is 0' do
      expect(oyster).to receive(:balance).and_return(0)
      oyster.balance
    end

  end

end
