class GameControl::CitiesController < GameControlController
  authorize_actions_for Admin

  def index
    @cities = City.order(:city)
  end

  def new
    @city = City.new
    @states = []
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to :game_control_cities, notice: 'City successfully created.'
    else
      render :new
    end
  end

  def edit
    @city = City.find params[:id]
    @states = Country.new.states(@city.country).map do |s|
      OpenStruct.new(s)
    end
  end

  def update
    @city = City.find params[:id]

    if @city.update_attributes(city_params)
      redirect_to :game_control_cities,
                  notice: "City <strong>#{@city.display_name}</strong> was successfully updated"
    else
      @states = Country.new.states(@city.country).map do |s|
        OpenStruct.new(s)
      end
      render :edit
    end
  end

  def destroy
    city = City.find params[:id]
    city.destroy
    redirect_to :game_control_cities, notice: 'city successfully deleted.'
  end

  private

  def city_params
    params.require(:city).permit(:display_name, :city, :state, :country)
  end
end
