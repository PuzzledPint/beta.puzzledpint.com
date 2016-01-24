require 'rails_helper'

RSpec.describe GameControl::EventsController, type: :controller do
  context 'no admin role' do
    describe 'GET index' do
      it 'responds with a 403' do
        request.env['devise.mapping'] = Devise.mappings[:admin]
        sign_in create(:admin)
        get :index
        expect(response).to be_forbidden
      end
    end
  end

  context 'with admin role' do
    login_admin
    render_views
    let!(:city) { create(:city, parent: create(:city)) }

    describe 'GET index' do
      it 'renders' do
        create(:event)
        get :index

        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET show' do
      context 'admin' do
        it 'renders' do
          get :show, id: create(:event).id

          expect(response).to be_successful
          expect(response).to render_template(:show)
        end
      end

      context 'location_gc' do
        login_location_gc

        it 'renders' do
          get :show, id: create(:event).id

          expect(response).to be_successful
          expect(response).to render_template(:show)
        end
      end
    end
    describe 'GET new' do
      it 'renders' do
        get :new

        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      it 'adds a new event and event_locations' do
        expect do
          expect(EventLocation.count).to eq(0)
          post_data = { "event_at(1i)" => "2016",
                        "event_at(2i)" => "1",
                        "event_at(3i)" => "21",
                        theme: 'theme' }
          post :create, event: post_data, city_ids: [city.id]
          expect(EventLocation.count).to eq(1)
        end.to change(Event, :count).by(1)
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
        event = create(:event)

        get :edit, id: event.id

        expect(response).to be_successful
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH update' do
      before { @event = create(:event) }

      it 'updates the event' do
        post_data = { "event_at(1i)" => "2016",
                      "event_at(2i)" => "1",
                      "event_at(3i)" => "21",
                      theme: 'theme name' }

        patch :update, id: @event.id, event: post_data

        expect(response).to redirect_to game_control_events_path
        expect(flash[:notice]).to match(/successful/i)

        @event.reload
        expect(@event.theme).to eq('theme name')
      end

      it 'displays messages' do
        patch :update, id: @event.id, event: { theme: '' }

        expect(response).to be_successful
        expect(response).to render_template(:edit)
        expect(assigns(:event).errors).not_to be_empty
      end
    end

    describe 'DELETE destroy' do
      it 'deletes event' do
        event = create(:event)

        expect do
          delete :destroy, id: event.id
          expect(flash[:notice]).to match(/successful/i)
        end.to change(Event, :count).by(-1)
      end
    end
  end
end
