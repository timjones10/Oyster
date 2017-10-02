class Oystercard

  attr_reader :balance

  def initialize
    balance = DEFAULT_BALANCE
  end

  private

  DEFAULT_BALANCE = 0

end  
