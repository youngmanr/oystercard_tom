class OysterCards

  MAX_CAPACITY = 90
  MIN_FARE = 1

  attr_reader :money, :travel_history

  def initialize
    @money = 0
    @in_journey = false
    @travel_history = []
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "min funds not available" if money < MIN_FARE
    @in_journey = true
    @travel_history << station
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
