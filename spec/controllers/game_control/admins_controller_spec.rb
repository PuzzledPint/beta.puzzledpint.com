require 'rails_helper'

RSpec.describe GameControl::AdminsController, type: :controller do
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
        get :index

        expect(assigns(:admins))

        expect(response).to be_successful
        expect(response).to render_template(:index)
      end
    end

    describe 'GET new' do
      it 'renders' do
        get :new

        expect(assigns(:admins))
        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      it 'adds a new user and sends an invite' do
        allow_any_instance_of(Admin).to receive(:invite!)
        expect do
          role = create(:admin_role)
          post_data = { email: 'e@e.com', full_name: 'name', role_ids: [role.id] }
          post :create, admin: post_data
          expect(response).to redirect_to(:game_control_admins)
        end.to change(Admin, :count).by(1)
      end
    end

    describe 'GET edit' do
      it 'renders' do
        admin = create(:admin)

        get :edit, id: admin.id

        expect(assigns(:admin))
        expect(response).to be_successful
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH update' do
      before { @admin = create(:admin) }

      it 'updates the admin' do
        post_data = { email: 'e@e.com', full_name: 'name', password: '' }

        patch :update, id: @admin.id, admin: post_data

        expect(response).to redirect_to game_control_admins_path
        expect(flash[:notice]).to match(/successful/i)

        @admin.reload
        expect(@admin.email).to eq('e@e.com')
        expect(@admin.full_name).to eq('name')
      end

      it 'displays messages' do
        patch :update, id: @admin.id, admin: { full_name: '' }

        expect(response).to be_successful
        expect(response).to render_template(:edit)
        expect(assigns(:admin).errors).not_to be_empty
      end
    end

    describe 'DELETE destroy' do
      it 'deletes admin' do
        admin = create(:admin)

        expect do
          delete :destroy, id: admin.id
          expect(flash[:notice]).to match(/successful/i)
        end.to change(Admin, :count).by(-1)
      end
    end
  end
end
