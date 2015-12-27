class EventLocationsController < ApplicationController
  def index
    @locations = Event.find(params[:event_id]).event_locations
  end
end
