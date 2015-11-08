require 'rails_helper'

RSpec.describe GameControl::AdminsController, type: :controller do
  login_admin

  describe 'GET index' do
    it 'renders' do
      get :index

      expect(assigns(:admins))
      expect(response).to render_template(:index)
    end
  end

  describe 'GET edit' do
    it 'renders' do
      admin = create(:admin)

      get :edit, id: admin.id

      expect(assigns(:admin))
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH update' do
    context 'successful' do
      it 'updates the admin' do
        admin = create(:admin)
        post_data = { email: 'e@e.com', full_name: 'name' }

        patch :update, id: admin.id, admin: post_data

        expect(response).to redirect_to edit_game_control_admin_path(admin)
        expect(flash[:notice]).to match(/successful/i)

        admin.reload
        expect(admin.email).to eq('e@e.com')
        expect(admin.full_name).to eq('name')
      end
    end

    context 'validation errors' do
      it 'displays messages' do
        admin = create(:admin)

        patch :update, id: admin.id, admin: { full_name: '' }

        expect(response).to render_template(:edit)
        expect(assigns(:admin).errors).not_to be_empty
      end
    end
  end
end
