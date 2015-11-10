class GameControl::AdminsController < GameControlController
  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find params[:id]
  end

  def update
    @admin = Admin.find params[:id]

    if @admin.update_attributes(update_params)
      redirect_to edit_game_control_admin_path(@admin), notice: 'User successfully updated'
    else
      render :edit
    end
  end

  private

  def update_params
    params[:admin].delete_if { |k, v| k == 'password' && v.empty? }
    params.required(:admin).permit(:full_name, :email, :password)
  end
end
