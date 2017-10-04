class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90

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

  def in_journey?
    @in_journey 
  end


end
