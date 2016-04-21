require 'journey'


describe Journey do

  subject(:journey) {described_class.new(:station)}

  it 'should have a starting station' do
    expect(journey.entry).to eq(:station)
  end

  describe '#finish' do

    before(:each) do
      journey.finish(:station)
    end

    it 'sets the exit station' do
      expect(journey.exit).to eq (:station)
    end

    it 'marks the journey as complete' do
      expect(journey).to be_complete
    end

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
