class VideosController < ApplicationController
  def index
    @videos = Video.filter(params.slice(:country_id, :q)).page(params[:page])
    @country = Country.find(params[:country_id])
  end
end
