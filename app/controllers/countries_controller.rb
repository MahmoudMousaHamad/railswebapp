class CountriesController < ApplicationController
    def index
        @countries = Country.all
    end

    def new
        @c = Country.new
    end

    def create
        @c = Country.new(params.require(:country).permit(:name, :about))
        if @c.save
            redirect_to @c
        else
            render 'new'
        end
    end

    def show
        @c = Country.find(params[:id])
    end

    def edit
        @c = Country.find(params[:id])
    end

    def update
        @c = Country.find(params[:id])
        if @c.update(params.require(:country).permit(:name, :about))
            redirect_to @c
        else 
            render 'edit'
        end
    end

    def destroy
        @c = Country.find(params[:id])
        if @c.destroy
            redirect_to countries_path
        else
            render "Something went wrong"
        end
    end 

end
