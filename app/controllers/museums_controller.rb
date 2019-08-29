class MuseumsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @museums = Museum.country_id(params[:country_id]).kind(params[:kind]).q_name(params[:q]).order_by(params[:order_by]).page(params[:page])
  end

  def show
    @i = Museum.find(params[:id])
  end
end
