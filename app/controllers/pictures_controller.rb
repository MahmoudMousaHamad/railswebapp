class PicturesController < ApplicationController
  def index
    @records = []
    country_id = params[:country_id]

    @records.concat Site.where("country_id = ?", country_id)
    @records.concat Museum.where("country_id = ?", country_id)
    @records.concat University.where("country_id = ?", country_id)

    @records = Kaminari.paginate_array(@records).page(params[:page]).per(10)

  end
end
