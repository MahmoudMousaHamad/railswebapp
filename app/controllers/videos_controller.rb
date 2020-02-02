class VideosController < ApplicationController
  breadcrumb "Countries", :countries_path
  def index
    @country = Country.find(params[:country_id])

    site_id = params[:site]

    if (site_id and site_id != "") and params[:city] != ""
      @videos = Video.filter(params.slice(:country_id, :city, :site, :order_by)).q_title(params[:q]).page(params[:page]).per(params[:results_per_page])
    else
      @videos = Video.filter(params.slice(:country_id, :city, :order_by)).q_title(params[:q]).page(params[:page]).per(params[:results_per_page])
    end

    breadcrumb @country.name, country_cities_path(@country)
    breadcrumb "Videos", country_videos_path(@country)
  end
end
