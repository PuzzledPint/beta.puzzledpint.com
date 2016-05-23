class GameControl::EventsController < GameControlController
  authorize_actions_for Event

  add_breadcrumb "<i class='fa fa-calendar'></i> Events".html_safe, :game_control_events_path

  def index
    @events = Event.all.order(event_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    load_location_data
  end

  def new
    @event = Event.new
    @cities = City.parent_cities.order(:name)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      EventService.new.add_event_locations(@event, params[:city_ids])
      redirect_to edit_game_control_event_path(@event), notice: 'Event successfully created.'
    else
      @cities = City.parent_cities.order(:name)
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    load_location_data
  end

  def update
    @event = Event.find params[:id]

    if @event.update_attributes(event_params)
      redirect_to game_control_events_path,
                  notice: "Event was successfully updated"
    else
      load_location_data
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

  def load_location_data
    @locations = build_locations
    @admin_locations = @locations.select do |l|
      current_admin.cities.map(&:id).include?(l.city_id)
    end
  end

  def build_locations
    @event.event_locations.sort { |x, y| x.city.display_name <=> y.city.display_name }
  end
end
