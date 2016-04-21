require 'oystercard'
require 'journey'

describe Journey do

it 'should have a starting station' do
  journey = Journey.new(:station)
  expect(journey.entry).to eq(:station)
end

end




#finishing a journey, calculating the fare of a journey, and returning whether or not the journey is complete.




# retain touch_in and touch_out on oystercard


# oystercard.touch_in(station)
# oystercard.touch_out(station)
# expect(journey).to not be nil



# oystercard.touch_in(station)
# expect {(oystercard.touch_in(station))}.to raise_error "You must touch out first before touching in"



# oystercard.touch_out(station)
# expect {(oystercard.touch_out(station))}.to raise_error "You must touch in first before touching out"



# oystercard.touch_in(station)
# oystercard.touch_out(station)
# expect(journey).to not be nil
