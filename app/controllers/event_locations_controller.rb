class EventLocationsController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    @locations = event.locations_tree
  end
end
