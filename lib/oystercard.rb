require_relative 'journey'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station
  attr_accessor :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(journey =Journey.new(station = nil))
    raise "Cannot touch in: not enough money for minimum fare of #{MINIMUM_FARE}" if balance < MINIMUM_FARE
    if journeys.empty? == false
      deduct(journeys.last.fare) if journeys.last.abnormal?
    end
    @journeys << journey
  end

  def touch_out(station)
    journeys.last.finish(station)
    deduct(journeys.last.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
