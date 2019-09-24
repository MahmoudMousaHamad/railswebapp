class CountriesController < ApplicationController
    def index
        @countries = Country.all.group_by { |country| IsoCountryCodes.search_by_name(country.name)[0].continent  }
    end
end
