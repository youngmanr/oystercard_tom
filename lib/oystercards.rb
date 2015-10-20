class OysterCards

  MAX_CAPACITY = 90
  MIN_BALANCE = 1

  attr_reader :money

  def initialize
    @money = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "min funds not available" if money < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def top_up(amount)
   fail "The limit is 90" if amount + money >= 90
   @money += amount
  end

  def deduct(amount)
 	 @money -= amount
  end


end
