class Journey

attr_reader :entry_station, :exit_station, :in_journey, :single_journey

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station
    @in_journey = true
    @single_journey = {}
  end

end
