require 'journey'
class Oystercard

  attr_reader :balance, :journey, :journey_histories


  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_histories = [] # to become journey_histories
    @journey
  end

  def top_up(amount)
    fail "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} will be exceded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "not enough balance" if balance < MINIMUM_BALANCE
    create_journey(entry_station)
    # @journey[:entry_station] = entry_station
    # @in_journey = true
  end

  def create_journey(entry_station)
      @journey = Journey.new(entry_station)
      @journey.start_journey
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey[:exit_station] = exit_station
    # @journeys << @journey
    @in_journey = false
  end

  def journey_histories(journey_object)
    @journey_histories << journey_object.single_journey
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
