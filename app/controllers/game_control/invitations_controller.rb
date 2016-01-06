class GameControl::InvitationsController < Devise::InvitationsController
  def after_invite_path_for(_)
    game_control_root_path
  end
end
