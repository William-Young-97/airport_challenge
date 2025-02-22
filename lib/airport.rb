 require_relative "plane"
 require_relative "weather"

 class Airport
  attr_accessor :capacity
  attr_reader :airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    weather_forcecast
    fail "Airport full; cannot land plane." if full?
    @airport << plane
  end

  def take_off
    weather_forcecast
    fail "Airport empty; cannot take off." if empty?
    @airport.pop
  end

  def full?
    @airport.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airport.empty?
  end

  def weather_forcecast
    Weather.new.conditions
  end
end
