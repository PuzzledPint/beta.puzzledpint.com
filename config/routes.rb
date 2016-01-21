Rails.application.routes.draw do
  root 'welcome#index'

  get '/events/:event_id/locations', controller: :event_locations,
                                     action: :index, defaults: { format: :json }

  scope :countries, controller: :countries do
    get "/", action: :index
    get "/:country/subdivisions", action: :subdivisions
  end

  devise_for :admins, path: :game_control,
                      controllers: { invitations: "game_control/invitations" }

  namespace :game_control do
    root 'dashboard#index'

    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    patch 'profile/password', to: 'profile#update_password'

    resources 'cities'
    resources 'admins'
    resources 'events' do
      resources 'event_locations'
    end
  end
end
