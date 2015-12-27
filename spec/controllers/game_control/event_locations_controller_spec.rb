require 'rails_helper'

RSpec.describe GameControl::EventLocationsController, type: :controller do
  context 'no admin role' do
    describe 'GET index' do
      it 'responds with a 403' do
        request.env['devise.mapping'] = Devise.mappings[:admin]
        sign_in create(:admin)
        get :edit, event_id: 1, id: 1
        expect(response).to be_forbidden
      end
    end
  end

  context 'with admin role' do
    login_admin
    render_views

    describe 'GET new' do
      it 'renders' do
        get :new, event_id: create(:event).id

        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      it 'adds a new event and event_locations' do
        expect do
          event = create(:event)
          post_data = { event_at: Time.zone.today,
                        theme: 'theme',
                        event_id: event.id,
                        city_id: create(:city).id }
          post :create, event_id: event.id, event_location: post_data
          expect(response).to redirect_to(edit_game_control_event_path(event))
        end.to change(EventLocation, :count).by(1)
      end

      it 'displays errors' do
        post :create, event_id: create(:event).id, event_location: { name: 'blah' }
        expect(response).to be_successful
        expect(response).to render_template(:new)
        expect(assigns(:location).errors).not_to be_empty
      end
    end

    describe 'GET edit' do
      it 'renders' do
        location = create(:event_location)

        get :edit, event_id: location.event.id, id: location.id

        expect(response).to be_successful
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH update' do
      before { @location = create(:event_location) }

      it 'updates the location' do
        post_data = { bar_name: 'bar name' }

        patch :update, event_id: @location.event.id,
                       id: @location.id,
                       event_location: post_data

        expect(response).to redirect_to edit_game_control_event_path @location.event
        expect(flash[:notice]).to match(/successful/i)

        @location.reload
        expect(@location.bar_name).to eq('bar name')
      end
    end

    describe 'DELETE destroy' do
      it 'deletes location' do
        location = create(:event_location)

        expect do
          delete :destroy, event_id: location.event.id, id: location.id
          expect(flash[:notice]).to match(/successful/i)
        end.to change(EventLocation, :count).by(-1)
      end
    end
  end
end
