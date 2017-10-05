class Oystercard

  attr_reader :balance, :journey, :journeys


  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @journeys = []
    @journey = {}
  end

  def top_up(amount)
    fail "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} will be exceded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "not enough balance" if balance < MINIMUM_BALANCE
    @journey[:entry_station] = entry_station
    @in_journey = true
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @journey[:exit_station] = exit_station
    @journeys << @journey
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
