class PicturesController < ApplicationController
  def index
    @records = []
    country_id = params[:country_id]

    @records.concat Site.filter(params.slice(:country_id, :city, :site)).q_name(params[:q])
    
    if params[:site] == "" or !params[:site]
      @records.concat Museum.filter(params.slice(:country_id, :city)).q_name(params[:q])
      @records.concat University.filter(params.slice(:country_id, :city)).q_name(params[:q])
    end

    @records = Kaminari.paginate_array(@records).page(params[:page]).per(20)

  end
end
