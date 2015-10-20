class OysterCards
  MAX_CAPACITY = 90

  attr_reader :money

  def initialize
    @money = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def touch_in
  end

  def touch_out
  end

  def top_up(amount)
   fail "The limit is 90" if amount + money >= 90
   @money += amount
  end

  def deduct(amount)
 	 @money -= amount
  end


end
