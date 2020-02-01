class CollegesController < ApplicationController
  def index
    @university = University.find(params[:university_id]).published
    @colleges = @university.colleges.published.page(params[:page])
    @country = @university.country
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "Universities", country_universities_path(@country)
    breadcrumb @university.name, country_university_path(@country, @university)
  end

  def show
    @i = College.find(params[:id])
    @university = @i.university
    @country = @university.country
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb @university.name, country_university_colleges_path(@country, @university)
    breadcrumb @i.name, country_university_college_path(@country, @university, @i)
  end
end
