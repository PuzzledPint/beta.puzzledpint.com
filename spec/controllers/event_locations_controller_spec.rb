require 'rails_helper'

RSpec.describe EventLocationsController, type: :controller do
  render_views

  describe 'GET index' do
    let(:event) { create(:event) }
    let(:city) { create(:city) }

    context 'simple structure' do
      let!(:location) { create(:event_location, event: event, city: city) }

      it 'returns a JSON message' do
        get :index, params: { event_id: event.id, format: :json }

        expect(response).to be_successful

        j = JSON.parse(response.body)
        l = j["locations"].first
        expect(l["bar"]).to eq(location.bar_name)
        expect(l["start_time"]).to eq(location.start_time.to_s(:time))
        expect(l["stop_time"]).to eq((location.start_time + 3.hours).to_s(:time))
        expect(l["notes"]).to eq(location.notes)
        expect(l["bar_url"]).to eq(location.bar_url)

        a = l["address"]
        expect(a["street_1"]).to eq(location.addr_street_1)
        expect(a["street_2"]).to eq(location.addr_street_2)
        expect(a["city"]).to eq(location.addr_city)
        expect(a["state"]).to eq(location.addr_state)
        expect(a["postal_code"]).to eq(location.addr_postal_code)
        expect(a["country"]).to eq(location.addr_country)
      end
    end

    context 'tree structure' do
      let(:city) { create(:city, parent: create(:city, name: 'Parent City'))}

      context 'notes only location' do
        let!(:location) { create(:event_location_notes_only,
                                 event: event,
                                 city: create(:city, parent:city))}

        it'returns the location' do
          get :index, params: { event_id: event.id, format: :json }
          expect(response).to be_successful
          j = JSON.parse(response.body)

          expect(j["locations"].count).to eq(1)
          location = j["locations"].first["locations"].first
          expect(location["notes"]).to be_present
        end
      end

      context 'notes and complete' do
        before  do
          create(:event_location,
                 event: event,
                 city: create(:city, parent: city))
          create(:event_location_notes_only,
                 event: event,
                 city: create(:city, parent: city))
        end

        it'returns the location' do
          get :index, params: { event_id: event.id, format: :json }
          expect(response).to be_successful
          j = JSON.parse(response.body)

          expect(j["locations"].first["locations"].count).to eq(2)
        end
      end
    end
  end
end
