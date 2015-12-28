require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    it { should validate_presence_of :theme }
    it { should validate_presence_of :event_at }
  end

  it { should have_many :event_locations }

  it 'destroys associated event_locations' do
    event = create(:event_location)
    expect { event.destroy }.to change(EventLocation, :count).by(-1)
  end

  it 'prevents past events from being destroyed' do
    event = create(:event, event_at: 1.day.ago)
    expect { event.destroy }.to raise_error 'Cannot destroy past events.'
  end

  describe '#locations_tree' do
    let(:city_1) { create(:city, name: 'City 1') }
    let(:city_2) { create(:city, name: 'City 2') }

    let(:event) { create(:event) }

    describe 'flat tree' do
      let!(:loc_1) { create(:event_location, event: event, city: city_1) }
      let!(:loc_2) { create(:event_location, event: event, city: city_2) }

      it 'returns a flat tree' do
        locations = event.locations_tree

        expect(locations.length).to eq(2)
        expect(locations.first).to eq(loc_1)
        expect(locations.second).to eq(loc_2)
      end
    end

    describe 'child last set' do
      let(:city_3) { create(:city, name: 'City 3') }
      let(:city_3_1) { create(:city, name: 'City 3.1', parent: city_3) }
      let(:city_3_2) { create(:city, name: 'City 3.2', parent: city_3) }

      let!(:loc_1) { create(:event_location, event: event, city: city_1) }
      let!(:loc_2) { create(:event_location, event: event, city: city_2) }
      let!(:loc_3_1) { create(:event_location, event: event, city: city_3_1) }
      let!(:loc_3_2) { create(:event_location, event: event, city: city_3_2) }
      let!(:loc_4) { create(:event_location, event: event, city: create(:city)) }

      it 'returns a structured tree' do
        locations = event.locations_tree
        expect(locations).to match_array([loc_1,
                                          loc_2,
                                          { city: city_3.name,
                                            locations: [loc_3_1, loc_3_2] },
                                          loc_4])
      end
    end
  end
end
