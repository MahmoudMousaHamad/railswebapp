class MuseumsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def show
    @i = Museum.find(params[:id])
  end
end
