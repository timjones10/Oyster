require "journey"

describe Journey do

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
