require 'rails_helper'

RSpec.describe GameControl::PagesController, type: :controller do
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
      before { @page = create(:page) }

      it 'renders a list of pages' do
        get :index
        expect(response).to be_successful
        expect(response).to render_template :index
        expect(response.body).to include @page.title
      end
    end

    describe 'GET new' do
      it 'renders a form' do
        get :new
        expect(response).to be_successful
        expect(response).to render_template :new
      end
    end

    describe 'POST create' do
      it 'creates a new page' do
        params = { active: '1',
                   title: 'New Page',
                   slug: 'slug',
                   content: 'Body' }
        expect do
          post :create, page: params
        end.to change(Page, :count).by(1)

        expect(response).to redirect_to edit_game_control_page_path(Page.last.id)
      end

      it 'handles errors' do
        expect do
          post :create, page: { active: false }
        end.not_to change(Page, :count)

        expect(response).to be_successful
        expect(response).to render_template(:new)
        expect(assigns(:page).errors).to be_present
      end
    end

    describe 'GET edit' do
      let(:page) { create(:page) }

      it 'renders a form' do
        get :edit, id: page
        expect(response).to be_successful
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH update' do
      let(:page) { create(:page) }

      it 'updates the page' do
        params = { active: '0',
                   title: 'New Page',
                   slug: 'New slug',
                   content: 'New Body' }
        patch :update, id: page, page: params

        page.reload
        expect(response).to redirect_to edit_game_control_page_path(page)
        expect(page.active).to be false
        expect(page.title).to eq params[:title]
        expect(page.slug).to eq 'new-slug'
        expect(page.content).to eq params[:content]
      end

      it 'handles errors' do
        patch :update, id: page, page: { title: '' }

        expect(response).to be_successful
        expect(response).to render_template(:edit)
        expect(assigns(:page).errors).to be_present
      end
    end

    describe 'DELETE destroy' do
      it 'destroys the page' do
        page = create(:page)
        expect { delete :destroy, id: page }.to change(Page, :count).by(-1)
      end
    end
  end
end
