require './lib/oystercard'
require_relative './lib/journey'
require_relative './lib/station'

oystercard = Oystercard.new
oystercard.top_up(10)

# oystercard.touch_in(Journey.new(Station.new())

oystercard.touch_in()
