class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance of #{Oystercard::MAXIMUM_BALANCE} will be exceded" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail "not enough balance" if balance < MINIMUM_BALANCE # balance in this line is not a variable - it is a method calling the value of @balance through the attr_reader
    @in_journey = true
  end

  def touch_out
    @balance -= MINIMUM_FARE
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end


end
