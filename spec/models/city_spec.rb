require 'rails_helper'

RSpec.describe City, type: :model do
  it { should belong_to(:parent) }
  it { should have_and_belong_to_many(:admins) }

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:country) }
  end

  describe '#full_display_name' do
    context 'has no parent' do
      it 'returns city full_display_name' do
        city = build(:city)
        expect(city.full_display_name).to eq city.name
      end
    end

    context 'has parent' do
      it 'returns city full_display_name with parent' do
        parent = build(:city)
        city = build(:city, parent: parent)
        expected_str = "#{parent.name} - #{city.name}"
        expect(city.full_display_name).to eq expected_str
      end
    end

    context 'has no parent' do
      it 'returns city full_display_name using display_name' do
        city = build(:city, name: 'abc', display_name: 'def')
        expect(city.full_display_name).to eq 'def'
      end
    end

    context 'has parent' do
      it 'returns city full_display_name with parent using display_name' do
        parent = build(:city, name: 'abc', display_name: 'def')
        city = build(:city, parent: parent, name: 'ghi', display_name: 'jkl')
        expected_str = "def - jkl"
        expect(city.full_display_name).to eq expected_str
      end
    end
  end
end
