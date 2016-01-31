class GameControl::InvitationsController < Devise::InvitationsController
  def after_accept_path_for(_)
    game_control_root_path
  end
end
