class PagesController < ApplicationController
  def show
    @page = Page.where(slug: params[:slug])
    @page = @page.where(active: true) unless params[:preview].present?
    @page = @page.first
    render 'errors/404', status: :not_found unless @page.present?
  end
end
