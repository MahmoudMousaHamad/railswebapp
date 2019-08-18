class ConferencesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @period = params[:period]
    @conferences = Conference.country(params[:country_id]).period(@period).category(params[:category_id]).page(params[:page])
  end

  def show
    @i = Conference.find(params[:id])
  end
end