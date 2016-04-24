class GameControl::PagesController < GameControlController
  authorize_actions_for Page

  add_breadcrumb "<i class='fa fa-files-o'></i> Pages".html_safe, :game_control_pages_path

  def index
    @pages = Page.where(parent: nil).order(:full_path)
  end

  def new
    @page = Page.new
    new_parents
  end

  def create
    @page = Page.new(parameters)
    if @page.save
      redirect_to edit_game_control_page_path(@page),
                  notice: 'Page successfully created.'
    else
      new_parents
      render :new
    end
  end

  def edit
    @page = Page.find params[:id]
    update_parents
  end

  def update
    @page = Page.find params[:id]

    if @page.update_attributes(parameters)
      redirect_to edit_game_control_page_path(@page),
                  notice: 'Page successfully updated.'
    else
      update_parents
      render :edit
    end
  end

  def destroy
    page = Page.find params[:id]
    page.destroy
    redirect_to game_control_pages_path, notice: 'Page successfully deleted.'
  end

  private

  def new_parents
    @parents = Page.order(:full_path)
  end

  def update_parents
    @parents = Page.where.not(id: @page.id).order(:full_path)
  end

  def parameters
    params.require(:page).
      permit(:active, :title, :slug, :content, :parent_id)
  end
end
