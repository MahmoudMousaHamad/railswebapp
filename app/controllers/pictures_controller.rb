class PicturesController < ApplicationController
  def index
    @pictures = []
    country_id = params[:country_id]

    @pictures.concat Country.find(country_id).photos

    City.where("country_id = ?", country_id).each do |i|
      @pictures.concat i.photos
    end

    Site.where("country_id = ?", country_id).each do |i|
      @pictures.concat i.photos
    end

    Museum.where("country_id = ?", country_id).each do |i|
      @pictures.concat i.photos
    end

    University.where("country_id = ?", country_id).each do |i|
      @pictures.concat i.photos
    end

    @pictures = Kaminari.paginate_array(@pictures).page(params[:page]).per(10)
  end
end
