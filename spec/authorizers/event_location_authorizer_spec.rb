require 'rails_helper'

RSpec.describe EventLocationAuthorizer do
  describe 'instance' do
    let(:city) { create(:city) }
    let(:event_location) { create(:event_location, city: city) }

    context 'is admin' do
      it 'can update' do
        user = create(:admin_user)
        expect(event_location.authorizer).to be_updatable_by(user)
      end
    end

    context 'owns city' do
      it 'can update' do
        user = create(:location_gc_user, cities: [city])
        expect(event_location.authorizer).to be_updatable_by(user)
      end

      it 'can update parent' do
        child_city = create(:city, parent: city)
        user = create(:location_gc_user, cities: [child_city])
        event_location = create(:event_location, city: child_city)

        expect(event_location.authorizer).to be_updatable_by(user)
      end
    end

    context 'does not own city' do
      it 'cannot update' do
        user = create(:location_gc_user)
        expect(event_location.authorizer).not_to be_updatable_by(user)
      end
    end
  end
end
