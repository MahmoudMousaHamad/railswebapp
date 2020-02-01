class UniversitiesController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @universities = @country.universities.page(params[:page])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "Universities", country_universities_path(@country)
  end

  def show
    @i = University.find(params[:id])
    @country = @i.country
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb @i.name, country_university_path(@country, @i)
  end
end
