class GameControl::DashboardController < GameControlController
  def index
    @upcoming_event = Event.upcoming
    @locations = @upcoming_event&.event_locations&.select do |l|
      current_admin.cities.map(&:id).include?(l.city_id)
    end
  end
end
