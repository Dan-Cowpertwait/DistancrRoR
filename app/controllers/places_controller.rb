class PlacesController < ApplicationController

    def index
        @user = current_user
        if params[:owner_id]
            @places = Owner.find(params[:owner_id]).places
        else
        @places = Place.all
        end
    end

    def new
        if params[:owner_id] && !Owner.exists?(params[:owner_id])
            redirect_to owners_path, alert: "Owner not found"
        else
        @place = Place.new(owner_id: params[:owner_id])
        end
    end

    def create
        place = Place.new(place_params)
        place.save
        redirect_to places_path(place)
    end


    def show
        @place = Place.find(params[:id])
        @user = current_user
        @individual = @user.individual
    end

    def edit
        if params[:owner_id]
            owner = Owner.find_by(id: params[:owner_id])
            if owner.nil?
                redirect_to owners_path, alert: "Owner not found"
            else
                @place = owner.places.find_by(id: params[:id])
                redirect_to owner_places_path(owner), alert: "Place not found" if @place.nil?
            end
        else
        @place = Place.find(params[:id])
        end
    end 

    def update
        @place = Place.find(params[:id])
        @place.update(place_params)
        @place.save
        redirect_to place_path(@place)
    end

    def destroy
        place = Place.find(params[:id])
        place.destroy
        respond_to do |format|
          format.html { redirect_to places_path, notice: 'place was successfully destroyed.'}
        end
      end

    private

    def place_params
        params.require(:place).permit(:name, :location, :phone, :occupancy, :owner_id)
    end 

end
