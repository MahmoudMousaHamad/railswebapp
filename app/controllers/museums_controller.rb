class MuseumsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @museums = Museum.where("country_id = ?", params[:country_id]).kind(params[:kind]).q(params[:q]).page(params[:page])
  end

  def show
    @i = Museum.find(params[:id])
  end
end
