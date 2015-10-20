class OysterCards

  MAX_CAPACITY = 90
  MIN_FARE = 1

  attr_reader :money, :entry_station

  def initialize
    @money = 0

    @entry_station
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    raise "min funds not available" if money < MIN_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
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
