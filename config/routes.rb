Rails.application.routes.draw do
  root 'welcome#index'

  scope :countries, controller: :countries do
    get "/", action: :index
    get "/:country/subdivisions", action: :subdivisions
  end

  devise_for :admins, path: :game_control
  namespace :game_control do
    root 'dashboard#index'

    get 'profile', to: 'profile#edit'
    patch 'profile', to: 'profile#update'
    patch 'profile/password', to: 'profile#update_password'

    resources 'cities'
    resources 'admins'
    resources 'events', except: :show do
      resources 'event_locations'
    end
  end
end
