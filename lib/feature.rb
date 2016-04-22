require './lib/oystercard'
require './lib/journey'
require './lib/station'

oystercard = Oystercard.new
oystercard.top_up(10)

# oystercard.touch_in(Journey.new(Station.new())

oystercard.touch_in()
