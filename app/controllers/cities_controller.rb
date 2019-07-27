class CitiesController < ApplicationController
    def index
        @cities = City.where("country = ?", params[:country_id])
        @country = Country.find(params[:country_id])
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
