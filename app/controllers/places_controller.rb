class PlacesController < ApplicationController

    def index
        @place = Place.all
        @user = current_user
    end

    def new
        @place = Place.new
    end

    def create
        @place = Place.create(place_params)
        @place.user = current_user
        redirect_to places_path
    end

    def show
        @place = Place.find(params[:id])
        @user = current_user
    end

    def edit
        @place = Place.find(params[:id])
    end 

    def update
        @place = Place.find(params[:id])
        @place.update(place_params)
        @place.save
        redirect_to place_path(@place)
    end

    private

    def place_params
        params.require(:place).permit(:name, :location, :phone, :occupancy, :tags, :owner_id)
    end 

end
