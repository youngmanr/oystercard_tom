require 'oystercards'

describe OysterCards do

  describe 'balance' do
    it 'has a default of 0' do
      expect(subject.money).to eq 0
    end
  end

  describe 'journey' do
    it { is_expected.to respond_to(:in_journey).with(1).argument }

    it 'a new oystercard is not in journey' do
      expect(subject.in_journey?).to be false
    end
  end

  describe 'travel history' do
    it 'is expected be able to store a log of the journies' do
      expect(subject.travel_history).to eq []
    end
  end

  describe '#top_up' do
    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.money }.by 1
    end

    it 'limit is 90' do
      expect{ subject.top_up(OysterCards::MAX_CAPACITY) }.to raise_error("The limit is 90")
    end
  end

  describe '#touch_in' do
    
    let(:station) {station}

    it 'is in journey after card has touched in' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect(subject).to be_in_journey
    end

    it 'raises an error if min funds not available' do
      expect { subject.touch_in(:station) }.to raise_error "min funds not available"
    end

    it 'stores touch in travel history to an array' do
      subject.top_up(10)
      subject.touch_in(:station)
      expect(subject.travel_history).to eq [:station]
    end
  end

  describe '#touch_out' do

    let(:station) {station}

    it 'is not in journey after card has touched out' do
      subject.top_up(10)
      subject.touch_in(:station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts the fare on touch out' do
      expect{ subject.touch_out }.to change { subject.money }.by -OysterCards::MIN_FARE
    end
  end

end
