class GameControl::EventLocationsController < GameControlController
  authorize_actions_for Admin

  #def new
    #@location = EventLocation.new
    #@cities = City.parent_cities.order(:name)
  #end

  #def create
    #@location = Event.new(location_params)
    #if @location.save
      #redirect_to edit_game_control_event_path @location.event,
                                               #notice: 'Location successfully created.'
    #else
      #@cities = City.parent_cities.order(:name)
      #render :new
    #end
  #end

  def edit
    @location = EventLocation.find(params[:id])
  end

  def update
    @location = EventLocation.find params[:id]

    if @location.update_attributes(location_params)
      redirect_to edit_game_control_event_path(@location.event),
                                          notice: "Location was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    location = EventLocation.find params[:id]
    location.destroy
    redirect_to game_control_events_path, notice: 'Location successfully deleted.'
  end

  private

  def location_params
    params.require(:event_location).permit(:bar_name, :start_time, :notes,
                                           :addr_street_1, :addr_street_2,
                                           :addr_city, :addr_state, :addr_country)
  end
end
