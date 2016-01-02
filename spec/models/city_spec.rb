require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to(:parent) }
  it { should have_and_belong_to_many(:admins) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:country) }
  end

  describe '#display_name' do
    context 'has no parent' do
      it 'returns city display_name' do
        city = build(:city)
        expect(city.display_name).to eq city.name
      end
    end

    context 'has parent' do
      it 'returns city display_name with parent' do
        parent = build(:city)
        city = build(:city, parent: parent)
        expected_str = "#{parent.name} - #{city.name}"
        expect(city.display_name).to eq expected_str
      end
    end
  end
end
