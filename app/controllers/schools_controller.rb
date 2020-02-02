class SchoolsController < ApplicationController
  breadcrumb "Countries", :countries_path
  def index
    @college = College.find(params[:college_id])
    @university = University.find(params[:university_id])
    @schools = @college.schools.page(params[:page])
    @country = @university.country
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb @university.name, country_university_path(@country, @university)
    breadcrumb @college.name, country_university_college_path(@country, @university, @college)
    breadcrumb "Schools", country_university_college_schools_path(@country, @university, @college, @schools)
  end

  def show
    @i = School.find(params[:id])
    @college = College.find(params[:college_id])
    @university = University.find(params[:university_id])
    @country = Country.find(params[:country_id])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb @university.name, country_university_path(@country, @university)
    breadcrumb @college.name, country_university_college_path(@country, @university, @college)
    breadcrumb "Schools", country_university_college_schools_path(@country, @university, @college, @schools)
  end
end
