class SitesController < ApplicationController
    breadcrumb "Countries", :countries_path
    def index
        @sites = Site.where("city_id = ?", params[:city_id])
        @city = City.find(params[:city_id])
        @country = @city.country
        if @sites
            @hash = Gmaps4rails.build_markers(@sites) do |site, marker|
                marker.lat site.lat
                marker.lng site.lng
                marker.title site.name
                marker.json({ link: country_city_site_path(@city.country.id, @city.id, site.id) })
            end
        end
        breadcrumb @country.name, country_cities_path(@country)
        breadcrumb @city.name, country_city_sites_path(@country, @city)
    end
end
