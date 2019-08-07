class HomeController < ApplicationController
    def index
        @countries = Country.all
        @hash = Gmaps4rails.build_markers(@countries) do |country, marker|
            results = Geocoder.search(country.name)
            coordinates = results.first.coordinates
            marker.lat coordinates[0]
            marker.lng coordinates[1]
            marker.title country.name
            marker.json({ link: country_cities_path(country.id) })
        end
    end 
end
