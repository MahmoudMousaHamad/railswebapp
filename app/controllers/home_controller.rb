class HomeController < ApplicationController
    def index
        @countries = Country.all.published
        @hash = Gmaps4rails.build_markers(@countries) do |country, marker|
            country_code = NormalizeCountry(country.name, to: :alpha2)
            marker.lat country.lat
            marker.lng country.lng
            marker.title country.name
            marker.picture({
                :url => "https://www.countryflags.io/#{country_code}/flat/32.png",
                :width   => 32,
                :height  => 32
            })
            marker.json({ link: country_cities_path(country.id) })
        end
    end 
end