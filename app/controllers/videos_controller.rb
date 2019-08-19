class VideosController < ApplicationController
  def index
    @videos = Video.where("country_id = ?", params[:country_id])
    
  end
end
