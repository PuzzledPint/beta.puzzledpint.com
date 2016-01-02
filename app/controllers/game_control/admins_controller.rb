class GameControl::AdminsController < GameControlController
  authorize_actions_for Admin

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    @admin.send_invite = true
  end

  def create
    @admin = Admin.new(create_params)
    @admin.password = temp_password

    if @admin.save
      @admin.invite!
      redirect_to game_control_admins_path, notice: 'User successfully created.'
    else
      render :new
    end
  end

  def edit
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find params[:id]

    if @admin.update_attributes(update_params)
      redirect_to game_control_admins_path,
                  notice: "User <strong>#{@admin.full_name}</strong> was successfully updated"
    else
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
