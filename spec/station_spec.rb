require 'station'

describe Station do

subject(:station) { described_class.new("Peckham", 2) }


  it "has a zone upon initialization" do
    expect(station.zone).to eq 2
  end

  it "has a name upon initialization" do
  expect(station.name).to eq "Peckham"
  end

end
