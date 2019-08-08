class CitiesController < ApplicationController
    def index
        @cities = City.where("country_id = ?", params[:country_id])
        @country = Country.find(params[:country_id])
        if @cities
            @hash = Gmaps4rails.build_markers(@cities) do |city, marker|
                results = Geocoder.search(city.name + ", " + @country.name)
                puts results
                coordinates = results.first.coordinates
                marker.lat coordinates[0]
                marker.lng coordinates[1]
                marker.title city.name
                marker.json({ link: country_city_sites_path(@country.id, city.id) })
            end
        end
    end

    def new
        @city = City.new
    end

    def create
        @city = City.new(params.require(:city).permit(:name, :country))
        if @city.save
            redirect_to cities_path
        else 
            render 'new'
        end
    end

    def show
        @city = City.find(params[:id])
    end

    def edit
        @city = City.find(params[:id])
    end

    def update
        @city = City.find(params[:id])
        if @city.update
            redirect_to cities_path
        else
            render 'edit'
        end
    end

    def destroy
        @city = City.find(params[:id])
        @city.destroy
        redirect_to cities_path
    end
    

end
