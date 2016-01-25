require 'rails_helper'

RSpec.describe EventService do
  describe '#add_event_locations' do
    it 'prepopulates locations from city info' do
      city = create(:city)
      event = create(:event)

      expect(event.event_locations).to be_empty

      subject.add_event_locations(event, [city.id])

      expect(event.event_locations.length).to be(1)
      location = event.event_locations.first
      expect(location.city_id).to eq(city.id)
      expect(location.addr_city).to eq(city.name)
      expect(location.addr_state).to eq(city.state)
      expect(location.addr_country).to eq(city.country)
    end
  end
end
