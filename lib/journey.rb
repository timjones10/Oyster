class Journey

attr_reader :entry_station, :exit_station, :in_journey, :single_journey

  def initialize(entry_station)
    @entry_station = entry_station
    @exit_station
    @in_journey = true
    @single_journey = {}
  end

  def start_journey
    @single_journey[:entry_station] = entry_station
  end

  def finish_journey(exit_station)
    @single_journey[:exit_station] = exit_station
    @in_journey = false
  end
end
