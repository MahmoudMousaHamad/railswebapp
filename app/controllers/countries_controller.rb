class CountriesController < ApplicationController
    def index
        @countries = {}
        @hash = Country.all.group_by { |country| IsoCountryCodes.search_by_name(country.name)[0].continent }
        @hash.each do |continent, countries|
            case continent
            when "AS"
                @countries["Asia"] = @hash.delete(continent)
            when "NA"
                @countries["North America"] = @hash.delete(continent)
            when "SA"
                @countries["South America"] = @hash.delete(continent)
            when "EU"
                @countries["Europe"] = @hash.delete(continent)
            when "AF"
                @countries["Africa"] = @hash.delete(continent)
            when "OC"
                @countries["Oceania"] = @hash.delete(continent)
            when "AN"
                @countries["Antarctica"] = @hash.delete(continent)
            end
        end
    end
end
