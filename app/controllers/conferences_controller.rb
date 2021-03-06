class ConferencesController < ApplicationController
  breadcrumb "Countries", :countries_path
  def index
    @country = Country.find(params[:country_id])
    @period = params[:period]
    @conferences = Conference.filter(params.slice(:country_id, :category, :period)).q_name(params[:q]).published.page(params[:page])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "Conferences", country_conferences_path(@country)
  end

  def show
    @i = Conference.find(params[:id])
    breadcrumb "Conferences", country_conferences_path(@country)
    breadcrumb @i.name, country_conference_path(@country, @i)
  end
end