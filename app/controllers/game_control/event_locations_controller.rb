class GameControl::EventLocationsController < GameControlController
  authorize_actions_for EventLocation

  before_action :load_event

  def new
    @location = @event.event_locations.build
    @cities = available_cities
  end

  def create
    @location = EventLocation.new(create_params)
    if @location.save
      redirect_to edit_game_control_event_path(@event),
                  notice: 'Location successfully created.'
    else
      @cities = available_cities
      render :new
    end
  end

  def edit
    @location = EventLocation.find params[:id]
  end

  def update
    @location = EventLocation.find params[:id]

    if @location.update_attributes(update_params)
      redirect_to edit_game_control_event_path(@event),
                  notice: "Location was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    location = EventLocation.find params[:id]
    location.destroy
    redirect_to edit_game_control_event_path(@event),
                notice: 'Location successfully deleted.'
  end

  private

  def available_cities
    all_cities = City.all.sort { |x, y| x.display_name <=> y.display_name }
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
end
