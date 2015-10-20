class OysterCards

  MAX_CAPACITY = 90
  MIN_FARE = 1

  attr_reader :money

  def initialize
    @money = 0
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station_ID)
    raise "min funds not available" if money < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_FARE)
  end

  def top_up(amount)
    fail "The limit is 90" if amount + money >= MAX_CAPACITY
    @money += amount
  end

  private

  def deduct(amount)
 	  @money -= amount
  end

end
