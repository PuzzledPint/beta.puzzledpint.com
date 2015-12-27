require 'rails_helper'

RSpec.describe EventLocationsController, type: :controller do
  render_views

  describe 'GET index' do
    it 'returns a JSON message' do
      location = create(:event_location)
      get :index, event_id: location.event.id, format: :json

      expect(response).to be_successful

      j = JSON.parse(response.body)
      l = j["locations"].first
      expect(l["bar_name"]).to eq(location.bar_name)
      expect(l["start_time"]).to eq(location.start_time)
      expect(l["notes"]).to eq(location.notes)

      a = l["address"]
      expect(a["street_1"]).to eq(location.addr_street_1)
      expect(a["street_2"]).to eq(location.addr_street_2)
      expect(a["city"]).to eq(location.addr_city)
      expect(a["state"]).to eq(location.addr_state)
      expect(a["postal_code"]).to eq(location.addr_postal_code)
      expect(a["country"]).to eq(location.addr_country)
    end
  end
end
