class GameControl::PagesController < GameControlController
  authorize_actions_for Page

  add_breadcrumb "<i class='fa fa-files-o'></i> Pages".html_safe, :game_control_pages_path

  def index
    @pages = Page.where(parent: nil).order(:full_path)
  end

  def new
    @page = Page.new
    @parents = Page.all
  end

  def create
    @page = Page.new(parameters)
    if @page.save
      redirect_to edit_game_control_page_path(@page),
                  notice: 'Page successfully created.'
    else
      render :new
    end
  end

  def edit
    @page = Page.find params[:id]
    @parents = Page.all
  end

  def update
    @page = Page.find params[:id]

    if @page.update_attributes(parameters)
      redirect_to edit_game_control_page_path(@page),
                  notice: 'Page successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    page = Page.find params[:id]
    page.destroy
    redirect_to game_control_pages_path, notice: 'Page successfully deleted.'
  end

  private

  def parameters
    params.require(:page).
      permit(:active, :title, :slug, :content, :parent_id)
  end
end
