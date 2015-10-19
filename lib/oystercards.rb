class OysterCards
  MAX_CAPACITY = 91

  attr_reader :money

  def initialize
    @money = 0
  end

  def top_up(amount)
   fail "The limit is 90" if amount + money > 90
   @money += amount
  end

  def deduct(amount)
 	 @money -= amount
  end


end
