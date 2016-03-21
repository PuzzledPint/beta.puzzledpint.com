class PagesController < ApplicationController
  def show
    @page = Page.where(active: true, slug: params[:slug]).first
    render 'errors/404', status: :not_found unless @page.present?
  end
end
