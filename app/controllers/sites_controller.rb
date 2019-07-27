class SitesController < ApplicationController
    def index
        @sites = Site.where("city_id = ?", params[:city_id])
        @city = City.find(params[:city_id])
    end

    def show
        @s = Site.find(params[:id])
    end

    def new
        @s = Site.new
    end

    def create
        @s = Site.new(params.require(:site).permit(:name,
                    :country, :city_id, :about, photos: []))
        if @s.save
            redirect_to @s
        else
            render 'new'
        end
    end

    def edit
        @s = Site.find(params[:id])
    end

    def update
        @s = Site.find(params[:id])
        if @s.update(params.require(:site).permit(:name, :country, :city_id,
                    :about, photos: []))
            redirect_to sites_path
        else
            render 'edit'
        end
    end

    def destroy
        @s = Site.find(params[:id])
        @s.destroy
        redirect_to sites_path
    end
end
