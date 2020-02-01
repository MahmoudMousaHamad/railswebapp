class ScholarshipsController < ApplicationController
  def index
    @country = Country.find(params[:country_id])
    @scholarships = Scholarship.filter(params.slice(:country_id, :degree, :university, :category)).q_name(params[:q]).page(params[:page]).per(params[:results_per_page])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "Scholarships", country_scholarships_path(@country)
  end

  def show
    @i = Scholarship.find(params[:id])
  end
end
