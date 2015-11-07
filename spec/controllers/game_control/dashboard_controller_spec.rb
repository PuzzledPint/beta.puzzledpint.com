require 'rails_helper'

RSpec.describe GameControl::DashboardController do
  context 'authentication' do
    context 'not logged in' do
      before { get :index }

      it { should redirect_to new_admin_session_path }
    end

    context 'logged in' do
      login_admin

      before { get :index }

      it { should render_template :index }
    end
  end
end
