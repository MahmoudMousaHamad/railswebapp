class UniversitiesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
  end

  def show
    @i = University.find(params[:id])
  end
end
