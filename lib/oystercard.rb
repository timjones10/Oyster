require 'journey'
class Oystercard

  attr_reader :balance, :journey, :journey_history


  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_history = []
    @journey
  end

  def top_up(amount)
    fail "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} will be exceded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "not enough balance" if balance < MINIMUM_BALANCE
    create_journey(entry_station)
  end

  def create_journey(entry_station)
      @journey = Journey.new(entry_station)
      @journey.start_journey
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey.finish_journey(exit_station)
    journey_histories(@journey)
  end

  def journey_histories(journey_object)
    @journey_history << journey_object.single_journey
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
