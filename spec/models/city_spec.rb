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
end
