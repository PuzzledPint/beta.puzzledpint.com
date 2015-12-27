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
      expect(a["addr_street_1"]).to eq(location.addr_street_1)
      expect(a["addr_street_2"]).to eq(location.addr_street_2)
      expect(a["addr_city"]).to eq(location.addr_city)
      expect(a["addr_state"]).to eq(location.addr_state)
      expect(a["addr_country"]).to eq(location.addr_country)
    end
  end
end
