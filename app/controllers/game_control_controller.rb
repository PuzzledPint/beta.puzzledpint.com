class GameControlController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'game_control'

  before_action :authenticate_admin!

  add_breadcrumb "<i class='fa fa-dashboard'></i>Dashboard".html_safe, :game_control_root_path

  def authority_forbidden(error)
    Authority.logger.warn(error.message)
    render 'errors/403_game_control', status: :forbidden
  end
end
