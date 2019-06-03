require 'rails_helper'

RSpec.describe EventLocationsController, type: :controller do
  render_views

  describe 'GET index' do
    let(:event) { create(:event) }
    let(:city_1) { create(:city, name: 'City 1') }
    let(:city_2) { create(:city, name: 'City 2') }
    let(:city_3) { create(:city, name: 'City 3') }
    let(:city_3_1) { create(:city, name: 'City 3.1', parent: city_3) }
    let(:city_3_2) { create(:city, name: 'City 3.2', parent: city_3) }

    let!(:loc_1) { create(:event_location, event: event, city: city_1) }
    let!(:loc_2) { create(:event_location, event: event, city: city_2) }
    let!(:loc_3_1) { create(:event_location, event: event, city: city_3_1) }
    let!(:loc_3_2) { create(:event_location, event: event, city: city_3_2) }
    let!(:loc_4) { create(:event_location, event: event, city: create(:city)) }

    it 'returns a JSON message' do
      get :index, params: { event_id: event.id, format: :json }

      expect(response).to be_successful

      j = JSON.parse(response.body)
      l = j["locations"].first
      expect(l["bar"]).to eq(loc_1.bar_name)
      expect(l["start_time"]).to eq(loc_1.start_time.to_s(:time))
      expect(l["stop_time"]).to eq((loc_1.start_time + 3.hours).to_s(:time))
      expect(l["notes"]).to eq(loc_1.notes)
      expect(l["bar_url"]).to eq(loc_1.bar_url)

      a = l["address"]
      expect(a["street_1"]).to eq(loc_1.addr_street_1)
      expect(a["street_2"]).to eq(loc_1.addr_street_2)
      expect(a["city"]).to eq(loc_1.addr_city)
      expect(a["state"]).to eq(loc_1.addr_state)
      expect(a["postal_code"]).to eq(loc_1.addr_postal_code)
      expect(a["country"]).to eq(loc_1.addr_country)
    end
  end
end
