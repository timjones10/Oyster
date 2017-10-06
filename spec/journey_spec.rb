require "journey"
#require 'o'
describe Journey do

 # subject(:journey) { described_class.new("Peckham") }

 describe "instance variables" do

   subject(:journey) { described_class.new("Peckham") }

  it 'initializes with an entry_station as an argument' do
  expect(journey.entry_station).to eq "Peckham"
  end

  it 'initializes with a nil value exit_station instance variable' do
    expect(journey.exit_station).to eq nil
  end

  it 'initializes with an in_journey intance variable set to true' do
  expect(journey.in_journey).to eq true
  end

  it 'initializes with a single_journey instance variable as a hash' do
    expect(journey.single_journey).to be_instance_of(Hash)
  end
end

  describe "start_journey" do

require 'oystercard'

    it 'start_journey updates the single journey variable with the entry station' do
      oc = Oystercard.new
      oc.create_journey("Tooting Bec")
      # journey.start_journey
      expect(oc.journey.single_journey).to eq({entry_station: "Tooting Bec"})
    end
  end

  describe "finish_journey" do

    subject(:journey) { described_class.new("Peckham") }

    it 'finish_journey updates the single_journey variablle with the exit station' do
      exit_station = "Shoreditch"
      journey.start_journey
      journey.finish_journey(exit_station)
      expect(journey.single_journey).to eq({entry_station: "Peckham", exit_station: "Shoreditch" })
    end

    it 'switches in_journey to false' do
      exit_station = "Shoreditch"
      journey.start_journey
      journey.finish_journey(exit_station)
      expect(journey.in_journey).to eq false
    end
  end
end
