require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to(:parent) }

  context 'validations' do
    it { should validate_presence_of(:display_name) }
    it { should validate_presence_of(:country) }

    it 'requires either a name xor a parent' do
      city = build(:city, name: nil)
      expect(city).to be_invalid

      city.parent = build(:city)
      expect(city).to be_valid

      city.name = 'foo'
      expect(city).to be_invalid

      city.parent = nil
      city.name = 'foo'
      expect(city).to be_valid
    end
  end

  describe '#full_name' do
    context 'has no parent' do
      it 'returns city display_name' do
        city = build(:city)
        expect(city.full_name).to eq city.display_name
      end
    end

    context 'has parent' do
      it 'returns city display_name with parent' do
        parent = build(:city)
        city = build(:city, parent: parent)
        expected_str = "#{parent.display_name} - #{city.display_name}"
        expect(city.full_name).to eq expected_str
      end
    end
  end
end
