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
      expect { oyster.top_up(1) }.to change { oyster.balance }.by 1
    end
    it 'raises error if we top up over the limit' do
      max_bal = Oystercard::MAXIMUM_BALANCE
      oyster.top_up(max_bal)
      expect { oyster.top_up(1) }.to raise_error "Maximum balance of #{max_bal} will be exceded"
    end
  end

  describe '#deduct' do

    it 'decrease the balance by the amount' do
      oyster.top_up(2)
      expect { oyster.deduct(1) }.to change { oyster.balance }.by -1
    end
  end

end
