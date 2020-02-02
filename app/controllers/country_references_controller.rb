class CountryReferencesController < ApplicationController
  breadcrumb "Countries", :countries_path
  def index
    @country = Country.find(params[:country_id])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "References", country_country_references_path(@country)
  end
end
