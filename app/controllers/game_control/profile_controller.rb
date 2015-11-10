class GameControl::ProfileController < GameControlController
  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    if @admin.update(update_params)
      sign_in @admin, bypass: true
      redirect_to game_control_profile_path,
        notice: 'Your profile as been update successfully'
    else
      render :edit
    end
  end

  def update_password
    @admin = current_admin
    if @admin.update_with_password(password_params)
      sign_in @admin, bypass: true
      redirect_to game_control_profile_path,
        notice: 'Your password as been update successfully'
    else
      render :edit
    end
  end

  private

  def update_params
    params.required(:admin).permit(:full_name, :email)
  end

  def password_params
    params.required(:admin).permit(:password, :password_confirmation,
                                   :current_password)
  end
end
