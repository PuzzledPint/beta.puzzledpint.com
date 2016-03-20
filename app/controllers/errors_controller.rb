class ErrorsController < ApplicationController
  layout :choose_layout

  def show
    template = params[:code]
    if current_admin && game_control_route?
      template += '_game_control'
    end
    render template, status: params[:code]
  end

  private

  def game_control_route?
    request.original_fullpath =~ /^\/game_control\/\.*/
  end

  def choose_layout
    return 'game_control' if current_admin && game_control_route?
  end
end
