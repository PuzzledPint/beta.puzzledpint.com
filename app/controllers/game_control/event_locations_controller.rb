class GameControl::EventLocationsController < GameControlController
  authorize_actions_for EventLocation, except: [:edit, :update, :copy]

  before_action :load_event, :add_breadcrumbs

  def new
    @location = @event.event_locations.build
    @cities = available_cities
    @states = []
  end

  def create
    @location = EventLocation.new(create_params)
    if @location.save
      redirect_to game_control_event_path(@event),
                  notice: 'Location successfully created.'
    else
      @cities = available_cities
      render :new
    end
  end

  def copy
    event = Event.find params[:event_id]
    @location = (EventLocation.find params[:event_location_id]).dup
    @location.event = event
    # Delete any existing location record for this month/event
    event.event_locations.where(city: @location.city).destroy_all
    if @location.save
      redirect_to game_control_event_path(@event),
                  notice: 'Location successfully created.'
    else
      @cities = available_cities
      render :new
    end
  end

  def edit
    @location = EventLocation.find params[:id]
    @recent_locations = @location.city.recent_locations(@location.event.event_at, 3)
    authorize_action_for(@location)
    generate_states
  end

  def update
    @location = EventLocation.find params[:id]
    authorize_action_for(@location)

    if @location.update_attributes(update_params)
      redirect_to game_control_event_path(@event),
                  notice: "Location was successfully updated"
    else
      generate_states
      render :edit
    end
  end

  def destroy
    location = EventLocation.find params[:id]
    location.destroy
    redirect_to game_control_event_path(@event),
                notice: 'Location successfully deleted.'
  end

  private

  def generate_states
    @states = Country.new.states(@location.addr_country).map do |s|
      OpenStruct.new(s)
    end
  end

  def available_cities
    all_cities = City.all.sort { |x, y| x.full_display_name <=> y.full_display_name }
    event_cities = @event.event_locations.map(&:city)
    all_cities - event_cities
  end

  def load_event
    @event = Event.find(params[:event_id])
  end

  def create_params
    params.require(:event_location).permit(:city_id, :event_id, :bar_name,
                                           :bar_url, :start_time, :notes,
                                           :addr_street_1, :addr_street_2, :addr_postal_code,
                                           :addr_city, :addr_state, :addr_country)
  end

  def update_params
    params.require(:event_location).permit(:bar_name, :bar_url, :start_time, :notes,
                                           :addr_street_1, :addr_street_2, :addr_postal_code,
                                           :addr_city, :addr_state, :addr_country)
  end

  def add_breadcrumbs
    add_breadcrumb "<i class='fa fa-calendar'></i> Events".html_safe, :game_control_events_path
    add_breadcrumb @event.theme, game_control_event_path(@event)
  end
end
