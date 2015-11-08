class GameControl::AdminsController < GameControlController
  def index
    @admins = Admin.all
  end
end
