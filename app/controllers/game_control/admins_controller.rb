class GameControl::AdminsController < GameControlController
  authorize_actions_for Admin

  add_breadcrumb "<i class='fa fa-users'></i> Users".html_safe, :game_control_admins_path

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    @admin.send_invite = true
    @cities = cities
  end

  def create
    @admin = Admin.new(create_params)
    @admin.password = temp_password

    if @admin.save
      @admin.invite! if create_params[:send_invite] == '1'
      redirect_to game_control_admins_path, notice: 'User successfully created.'
    else
      @cities = cities
      render :new
    end
  end

  def edit
    @admin = Admin.find params[:id]
    @cities = cities
  end

  def update
    @admin = Admin.find params[:id]

    if @admin.update_attributes(update_params)
      redirect_to game_control_admins_path,
                  notice: "User <strong>#{@admin.full_name}</strong> was successfully updated"
    else
      @cities = cities
      render :edit
    end
  end

  def destroy
    admin = Admin.find params[:id]
    admin.destroy
    redirect_to game_control_admins_path, notice: 'User successfully deleted.'
  end

  private

  def temp_password
    Devise.friendly_token
  end

  def cities
    City.all.sort { |x, y| x.full_display_name <=> y.full_display_name }
  end

  def create_params
    params[:admin].delete_if { |k, v| k == 'password' && v.empty? }
    params.required(:admin).permit(:full_name, :email, :send_invite,
                                   role_ids: [], city_ids: [])
  end

  def update_params
    params[:admin].delete_if { |k, v| k == 'password' && v.empty? }
    params.required(:admin).permit(:full_name, :email, :password,
                                   role_ids: [], city_ids: [])
  end
end
