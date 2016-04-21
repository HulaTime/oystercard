require 'journey'


describe Journey do

  subject(:journey) {described_class.new(:station)}

  it 'should have a starting station' do
    expect(journey.entry_station).to eq(:station)
  end

  describe '#finish' do

    before(:each) do
      journey.finish(:station)
    end

    it 'sets the exit station' do
      expect(journey.exit_station).to eq (:station)
    end

    it 'marks the journey as complete' do
      expect(journey).to be_complete
    end

  end

  #Maybe deleted because abnormal? may be made private
  describe '#abnormal' do

    it 'returns true if entry station is nil' do
      journey = Journey.new(nil)
      journey.finish(:station)
      expect(journey).to be_abnormal
    end

    it 'returns true if exit station is nil' do
      journey.finish(nil)
      expect(journey).to be_abnormal
    end

    it 'returns false if neither entry nor exit station is nil' do
      journey.finish(:station)
      expect(journey).not_to be_abnormal
    end

  end

  describe '#fare' do

    it 'calculates the fare for normal journeys' do
      journey.finish(:station)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
    #if (journey.normal?.eq true) fare = fare

    it 'levies a penalty if journey is abnormal' do
      journey.finish(nil)
      expect(journey.fare).to eq Journey::PENALTY
    #if (journey.normal?.eq false) fare = PENALTY
    end
  end
end




# calculating the fare of a journey


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
