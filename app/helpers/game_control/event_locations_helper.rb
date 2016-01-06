module GameControl::EventLocationsHelper
  def cancel_path(event)
    if current_admin.can_update?(event)
      edit_game_control_event_path(event)
    else
      game_control_event_path(event)
    end
  end
end
