class EventLocationsController < ApplicationController
  def index
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    event = Event.find(params[:event_id])
    @locations = event.locations_tree
    analytics(event)
  end

  private

  def analytics(event)
    session_id = session.id || 'anonymous_user'
    track_index(event, session_id)
    id_index(session_id)
  end

  def track_index(event, session_id)
    Analytics.track(
      anonymous_id: session_id,
      event: 'Viewed Location Info',
      properties: { event_id: event.id, date: event.event_at, theme: event.theme },
      context: { ip: request.ip }
    )
  end

  def id_index(session_id)
    Analytics.identify(
      anonymous_id: session_id,
      context: { ip: request.ip }
    )
  end
end
