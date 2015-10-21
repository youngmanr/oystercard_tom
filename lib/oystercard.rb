class OysterCard

  MAX_BALANCE = 90
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
    fail "The maximum balance is #{MAX_BALANCE}" if amount + money >= MAX_BALANCE
    @money += amount
  end

  private

  def deduct(amount)
 	  @money -= amount
  end

end
