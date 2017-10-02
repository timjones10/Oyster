require "oystercard"

describe Oystercard do

  subject(:oyster) { described_class.new }

  describe '#balance' do

    it 'checks that the default balance is 0' do
      expect(oyster.balance).to eq 0

    end
  end

  describe '#top_up' do

    it 'increase the balance by the amount' do
      oyster.top_up(5)
      expect(oyster.balance).to eq 5
    end
  end

end
