require 'rails_helper'

RSpec.describe GameControl::ProfileController, type: :controller do
  login_admin

  describe 'GET edit' do
    it 'renders' do
      get :edit

      expect(assigns(:admin))
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH update' do
    context 'successful' do
      it 'updates the user' do
        post_data = { email: 'e@e.com', full_name: 'name', password: '' }

        admin = subject.current_admin
        patch :update, id: admin.id, admin: post_data

        expect(response).to redirect_to game_control_profile_path
        expect(flash[:notice]).to match(/successful/i)

        admin.reload
        expect(admin.email).to eq('e@e.com')
        expect(admin.full_name).to eq('name')
      end
    end

    context 'validation errors' do
      it 'displays messages' do
        patch :update, admin: { full_name: '' }

        expect(response).to render_template(:edit)
        expect(assigns(:admin).errors).not_to be_empty
      end
    end
  end

  describe 'PATCH update_password' do
    context 'successful' do
      it "updates the user' password" do
        post_data = { current_password: 'password',
                      password: 'password_new',
                      password_confirmation: 'password_new' }

        patch :update_password, admin: post_data

        expect(response).to redirect_to game_control_profile_path
        expect(flash[:notice]).to match(/successful/i)
      end
    end

    context 'validation errors' do
      def validate_message(post_data, field, msg)
        patch :update_password, admin: post_data

        expect(response).to render_template(:edit)
        expect(assigns(:admin).errors[field].first).to eq(msg)
      end

      it 'handles incorrect current_password' do
        post_data = { current_password: 'asdads' }
        validate_message(post_data, :current_password, 'is invalid')
      end

      it 'handles incorrect confirm_password' do
        post_data = { current_password: 'password',
                      password: 'password2',
                      password_confirmation: 'wrong' }
        validate_message(post_data, :password_confirmation, "doesn't match Password")
      end
    end
  end
end
