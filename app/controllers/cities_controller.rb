class CitiesController < ApplicationController
    breadcrumb "Countries", :countries_path
    def index
        @cities = City.where("country_id = ?", params[:country_id]).published
        @country = Country.find(params[:country_id])
        if @cities
            @hash = Gmaps4rails.build_markers(@cities) do |city, marker|
                marker.lat city.lat
                marker.lng city.lng
                marker.title city.name
                marker.json({ link: country_city_sites_path(@country.id, city.id) })
            end
        end
        breadcrumb @country.name, country_cities_path(@country)
    end
end
