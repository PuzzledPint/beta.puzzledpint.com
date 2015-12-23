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

    xdescribe 'GET new' do
      it 'renders' do
        get :new, event_id: 1

        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end

    xdescribe 'POST create' do
      it 'adds a new event and event_locations' do
        expect do
          expect(EventLocation.count).to eq(0)
          event = create(:event)
          post_data = { event_at: Time.zone.today,
                        theme: 'theme' }
          post :create, event: post_data, city_ids: [event.id]
          expect(EventLocation.count).to eq(1)
        end.to change(City, :count).by(1)
      end

      it 'displays errors' do
        post :create, event: { name: 'blah' }
        expect(response).to be_successful
        expect(response).to render_template(:new)
        expect(assigns(:event).errors).not_to be_empty
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
