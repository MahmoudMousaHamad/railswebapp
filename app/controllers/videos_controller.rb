class VideosController < ApplicationController
  def index
    @country = Country.find(params[:country_id])

    site_id = params[:site]

    if (site_id and site_id != "") and params[:city] != ""
      @videos = Video.filter(params.slice(:country_id, :city, :site, :order_by)).q_title(params[:q]).page(params[:page])
    else
      @videos = Video.filter(params.slice(:country_id, :city, :order_by)).q_title(params[:q]).page(params[:page])
    end
  end
end
