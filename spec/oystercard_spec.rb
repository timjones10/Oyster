require "oystercard"
require "journey"

describe Oystercard do

  subject(:oyster) { described_class.new }
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}


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

  # describe '#deduct' do
  #
  #   it 'decrease the balance by the amount' do
  #     oyster.top_up(2)
  #     expect { oyster.deduct(1) }.to change { oyster.balance }.by -1
  #   end
  # end

  describe "#in_journey? tests" do
    it "reports the status of the card depending on touch_in and touch_out" do
      expect(oyster).not_to be_in_journey
      # expect(oyster.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
  #   it "updates the in_journey status of the card" do
  #     min_bal = Oystercard::MINIMUM_BALANCE
  #     oyster.top_up(min_bal)
  #     oyster.touch_in(entry_station)
  #     expect(oyster.in_journey?).to eq true
  #     # expect(oyster).to be_in_journey
  #   end
    it "raises an error if balance is below minimum balance" do
      expect {oyster.touch_in((entry_station))}.to raise_error "not enough balance"
    end

    # it "records your entry station when you touch in" do
    #   min_bal = Oystercard::MINIMUM_BALANCE
    #   oyster.top_up(min_bal)
    #   oyster.touch_in(entry_station)
    #   expect(oyster.journey).to eq ({:entry_station => entry_station})
    # end
  end

  describe '#create journey' do

    it 'create a new instance of journey class and take entry_station argument' do
      entry_station = "Peckham"
      expect(oyster.create_journey(entry_station)).to eq("Peckham")
    end
  end
  describe 'touch_out' do
    # it 'updates the in_journey status of the card' do
    #   min_bal = Oystercard::MINIMUM_BALANCE
    #   oyster.top_up(min_bal)
    #   oyster.touch_in(entry_station)
    #   oyster.touch_out(exit_station)
    #   expect(oyster.in_journey?).to eq false
    # end
  end

  # it 'deducts the minimum fare from the card' do
  #   min_bal = Oystercard::MINIMUM_BALANCE
  #   oyster.top_up(min_bal)
  #   oyster.touch_in(entry_station)
  #   expect {oyster.touch_out(exit_station)}.to change{oyster.balance}.by(-1)
  # end


  # let (:journey) {{entry_station: entry_station, exit_station: exit_station}}
  #
  # it 'adds entry_station and exit_station to a journey_list on touch out' do
  #   min_bal = Oystercard::MINIMUM_BALANCE
  #   oyster.top_up(min_bal)
  #   oyster.touch_in(entry_station)
  #   oyster.touch_out(exit_station)
  #   expect(oyster.journeys).to include journey
  # end

  it 'creates an empty array on initialization' do
    test_journey = Journey.new("Peckham")
    expect(oyster.journey_histories(test_journey)).to eq ([{}])
  end

  describe 'journey_histories' do
    it 'adds the hash stored in the journey object to journey histories variable' do
      test_journey = Journey.new("Peckham")
      test_journey.start_journey
      test_journey.finish_journey("Shoreditch")
      p test_journey.single_journey
      expect(oyster.journey_histories(test_journey)).to eq([{entry_station: "Peckham", exit_station: "Shoreditch" }])
    end
  end

end
