class Oystercard

  attr_reader :balance, :entry_station

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    # @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} will be exceded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "not enough balance" if balance < MINIMUM_BALANCE # balance in this line is not a variable - it is a method calling the value of @balance through the attr_reader
    # @in_journey = true
    @entry_station = entry_station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    # @in_journey = false
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
