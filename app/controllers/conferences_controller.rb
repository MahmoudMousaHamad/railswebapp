class ConferencesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def show
    @i = Conference.find(params[:id])
  end
end
