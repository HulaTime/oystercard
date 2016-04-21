require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  let(:journey) { spy :journey }

  context "when initialized" do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
    end

    it "has no journey history by default" do
      expect(oystercard.journeys).to eq []
    end
  end

	describe "#top_up" do

		it "adds money to its balance" do
			expect { oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
		end

		it "raises error if exceeding MAX amount" do
		  oystercard.top_up described_class::MAXIMUM_BALANCE
		  expect { oystercard.top_up 1 }.to raise_error "Cannot exceed the limit of #{described_class::MAXIMUM_BALANCE}"
		end

	end

	describe "#touch_in" do

		it "raise error if not enough balance" do
		  message = "Cannot touch in: not enough money for minimum fare of #{described_class::MINIMUM_FARE}"
		  expect { oystercard.touch_in(journey) }.to raise_error message
		end

    it "shove the journey into the journeys" do
      oystercard.top_up(30)
      oystercard.touch_in(journey)
      expect(oystercard.journeys).to include journey
    end
	end

	describe "#touch_out" do

    before(:each) do
      oystercard.top_up(30)
      oystercard.touch_in(journey)
      allow(journey).to receive(:fare).and_return(1)
    end

    it 'send the finish message to the last journey with the exit station' do
      oystercard.touch_out(:station)
      expect(journey).to have_received(:finish).with(:station)
    end

    it "deducts the fare" do
      allow(journey).to receive(:fare).and_return(1)
      expect{oystercard.touch_out(:station)}.to change{oystercard.balance}.by(-1)
    end

	end

  describe "#journeys" do

    xit "gives a list of journeys" do
      oystercard.top_up 10
      expect(oystercard.journeys).to include
    end
  end


end
