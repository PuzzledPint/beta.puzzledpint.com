class GameControl::CitiesController < GameControlController
  authorize_actions_for City

  add_breadcrumb "<i class='fa fa-building'></i> Cities".html_safe, :game_control_cities_path

  def index
    @cities = City.parent_cities.order(:name)
  end

  def new
    @city = City.new
    generate_parents
    @states = []
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to :game_control_cities, notice: 'City successfully created.'
    else
      generate_parents
      render :new
    end
  end

  def edit
    @city = City.find params[:id]
    generate_states
    generate_parents
  end

  def update
    @city = City.find params[:id]

    if @city.update_attributes(city_params)
      redirect_to :game_control_cities,
                  notice: "City <strong>#{@city.display_name}</strong> was successfully updated"
    else
      generate_states
      generate_parents
      render :edit
    end
  end

  def destroy
    city = City.find params[:id]
    city.destroy
    redirect_to :game_control_cities, notice: 'city successfully deleted.'
  end

  private

  def generate_states
    @states = Country.new.states(@city.country).map do |s|
      OpenStruct.new(s)
    end
  end

  def generate_parents
    @parents = City.parent_cities.order(:name)
  end

  def city_params
    params.require(:city).permit(:name, :state, :country, :parent_id)
  end
end
