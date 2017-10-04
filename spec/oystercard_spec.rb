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

  describe "#in_journey? tests" do
    it "reports the status of the card depending on touch_in and touch_out" do
      expect(oyster).not_to be_in_journey
      # expect(oyster.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it "updates the in_journey status of the card" do
      min_bal = Oystercard::MINIMUM_BALANCE
      oyster.top_up(min_bal)
      oyster.touch_in
      expect(oyster.in_journey?).to eq true
      # expect(oyster).to be_in_journey
    end
    it "raises an error if balance is below minimum balance" do
      expect {oyster.touch_in}.to raise_error "not enough balance"
    end
  end

  describe 'touch_out' do
    it 'updates the in_journey status of the card' do
      min_bal = Oystercard::MINIMUM_BALANCE
      oyster.top_up(min_bal)
      oyster.touch_in
      oyster.touch_out
      expect(oyster.in_journey?).to eq false
    end
  end

end
