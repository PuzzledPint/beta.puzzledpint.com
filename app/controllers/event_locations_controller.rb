class EventLocationsController < ApplicationController
  def index
    @locations = Event.includes(event_locations: :city).
      find(params[:event_id]).event_locations.
      sort { |x, y| x.city.display_name <=> y.city.display_name }
  end
end
