require 'rails_helper'
include ControllerMacros

RSpec.describe GameControl::EventLocationsHelper do

  describe '#cancel_path' do

    context 'can edit location' do
      it 'returns the edit path' do
        user = create(:admin_user)
        allow(helper).to receive(:current_admin).and_return(user)
        event = build(:event_location).event

        expect(helper.cancel_path(event)).to eq(edit_game_control_event_path(event))
      end
    end

    context 'cannot edit location' do
      it 'returns the show path' do
        user = create(:location_gc_user)
        allow(helper).to receive(:current_admin).and_return(user)
        event = build(:event_location).event

        expect(helper.cancel_path(event)).to eq(game_control_event_path(event))
      end
    end
  end
end
