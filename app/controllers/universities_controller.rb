class UniversitiesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @universities = @country.universities.page(params[:page])
  end

  def show
    @i = University.find(params[:id])
  end
end
