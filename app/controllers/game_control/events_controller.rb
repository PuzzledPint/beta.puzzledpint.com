class GameControl::EventsController < GameControlController
  authorize_actions_for Admin

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @cities = City.parent_cities.order(:name)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      params[:city_ids].each do |city|
        @event.event_locations.create(city_id: city)
      end

      redirect_to edit_game_control_event_path(@event), notice: 'Event successfully created.'
    else
      @cities = City.parent_cities.order(:name)
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @locations = @event.event_locations.sort { |x, y| x.city.display_name <=> y.city.display_name }
  end

  def update
    @event = Event.find params[:id]

    if @event.update_attributes(event_params)
      redirect_to game_control_events_path,
                  notice: "Event was successfully updated"
    else
      @locations = @event.event_locations.sort { |x, y| x.city.display_name <=> y.city.display_name }
      render :edit
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy
    redirect_to game_control_events_path, notice: 'Event successfully deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:event_at, :theme)
  end
end
