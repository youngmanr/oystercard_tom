require 'oystercards'

describe OysterCards do

  describe 'balance' do
    it 'has a default of 0' do
      expect(subject.money).to eq 0
    end
  end

  describe 'journey' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'a new oystercard is not in journey' do
      expect(subject.in_journey?).to be false
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.money }.by 1
    end

    it 'limit is 90' do
      expect{ subject.top_up(OysterCards::MAX_CAPACITY) }.to raise_error("The limit is 90")
    end
  end

  describe '#deduct' do
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deduct money' do
      expect{ subject.deduct 1 }.to change{ subject.money }.by -1
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'is in journey after card has touched in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }

    it 'is not in journey after card has touched out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end
