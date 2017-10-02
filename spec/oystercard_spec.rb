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
      expect { oyster.top_up(1)}.to change { oyster.balance }.by 1
    end
  end

end
