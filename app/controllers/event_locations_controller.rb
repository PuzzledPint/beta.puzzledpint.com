class EventLocationsController < ApplicationController
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    event = Event.find(params[:event_id])
    @locations = event.locations_tree
  end
end
