require 'rails_helper'

RSpec.describe GameControl::CitiesController, type: :controller do
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

    describe 'GET index' do
      it 'renders' do
        create(:city)
        get :index

        expect(assigns(:cities))

        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET new' do
      it 'renders' do
        get :new

        expect(assigns(:city))
        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      it 'adds a new city' do
        expect do
          post_data = { name: 'city name',
                        state: 'state',
                        country: 'country' }
          post :create, params: {  city: post_data }
        end.to change(City, :count).by(1)
      end

      it 'displays errors' do
        post :create, params: { city: { name: 'blah' } }
        expect(response).to be_successful
        expect(response).to render_template(:new)
        expect(assigns(:city).errors).not_to be_empty
      end
    end

    describe 'GET edit' do
      it 'renders' do
        city = create(:city)

        get :edit, params: { id: city.id }

        expect(assigns(:city))
        expect(response).to be_successful
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH update' do
      before { @city = create(:city) }

      it 'updates the city' do
        post_data = { name: 'name', country: 'EEUU' }

        patch :update, params: { id: @city.id, city: post_data }

        expect(response).to redirect_to game_control_cities_path
        expect(flash[:notice]).to match(/successful/i)

        @city.reload
        expect(@city.name).to eq('name')
        expect(@city.country).to eq('EEUU')
      end

      it 'displays messages' do
        patch :update, params: { id: @city.id, city: { name: '' } }

        expect(response).to be_successful
        expect(response).to render_template(:edit)
        expect(assigns(:city).errors).not_to be_empty
      end
    end

    describe 'DELETE destroy' do
      it 'deletes city' do
        city = create(:city)

        expect do
          delete :destroy, params: { id: city.id }
          expect(flash[:notice]).to match(/successful/i)
        end.to change(City, :count).by(-1)
      end
    end
  end
end
