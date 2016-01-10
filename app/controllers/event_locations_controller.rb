class EventLocationsController < ApplicationController
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    event = Event.find(params[:event_id])
    @locations = event.locations_tree
    Analytics.identify(anonymous_id: session.id)
    Analytics.track(
      anonymous_id: session.id,
      event: 'Viewed Location Info',
      properties: { event_id: event.id, date: event.event_at, theme: event.theme }
    )
  end
end
