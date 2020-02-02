class PicturesController < ApplicationController
  breadcrumb "Countries", :countries_path
  def index
    @records = []
    country_id = params[:country_id]
    site_id = params[:site]

    if (site_id and site_id != "") and params[:city] != ""
      @records.concat Site.filter(params.slice(:country_id, :city)).id(params[:site])
    else
      @records.concat Site.filter(params.slice(:country_id, :city)).q_name(params[:q])
      @records.concat Museum.filter(params.slice(:country_id, :city)).q_name(params[:q])
      @records.concat University.filter(params.slice(:country_id, :city)).q_name(params[:q])
    end
    @country = Country.find(country_id)
    @records = Kaminari.paginate_array(@records).page(params[:page]).per(params[:results_per_page])
    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "Pictures", country_pictures_path(@country)
  end
end
