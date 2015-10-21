require 'station'

describe Station do

  subject(:station) { described_class.new( :name, :zone) }

  describe 'initialization' do
    it 'a new station has a name' do
      expect(station.name).to eq :name
    end

    it 'a new station has a zone' do
      expect(station.zone).to eq :zone
    end
  end

end

