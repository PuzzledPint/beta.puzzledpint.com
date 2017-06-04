class GameControl::SessionsController < Devise::SessionsController
  layout 'devise'

  private

  def after_sign_in_path_for(_)
    stored_location_for(resource_name) || game_control_root_path
  end

  def after_sign_out_path_for(_)
    game_control_root_path
  end
end
