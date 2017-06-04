class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_action

  private

  def after_sign_out_path_for(_)
    game_control_root_path
  end

  def store_action
    return unless request.get?
    if request.path.end_with?("/sign_in") && !request.xhr? # don't store ajax calls
      store_location_for(:admin, game_control_root_path)
    end
  end
end
