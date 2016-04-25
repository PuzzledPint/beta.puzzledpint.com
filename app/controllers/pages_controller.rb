class PagesController < ApplicationController
  def show
    @page = Page.where(full_path: params[:path])
    @page = @page.active unless params[:preview].present?
    @page = @page.first
    render 'errors/404', status: :not_found unless @page.present?
  end

  def home
    render :home, layout: 'home'
  end
end
