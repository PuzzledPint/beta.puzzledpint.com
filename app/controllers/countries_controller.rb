class CountriesController < ApplicationController
  respond_to :json

  def index
    render json: Country.new.countries
  end

  def subdivisions
    render json: Country.new.subdivisions(params[:country])
  end
end
