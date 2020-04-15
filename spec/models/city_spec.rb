require 'rails_helper'

RSpec.describe City, type: :model do
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

  describe '#recent_locations' do
    before do
      @city = create(:city)
      @brand_new_city = create(:city)
      @event1 = create(:event, event_at: 1.month.ago)
      @event2 = create(:event, event_at: 2.months.ago)
      @event3 = create(:event, event_at: 3.months.ago)
      @location1 = create(:event_location, city: @city, event: @event1, bar_name: 'one bar ago')
      @location2 = create(:event_location, city: @city, event: @event2, bar_name: 'two bars ago')
      @location3 = create(:event_location, city: @city, event: @event3, bar_name: 'three bars ago')
    end
    it 'returns two recent locations' do
      recents = @city.recent_locations(1.day.ago, 2)
      expect(recents.size).to eq(2)
    end
    it 'returns zero recent locations for a new city' do
      recents = @brand_new_city.recent_locations(1.day.ago, 3)
      expect(recents.size).to eq(0)
    end
  end
end
