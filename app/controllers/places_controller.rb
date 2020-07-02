class PlacesController < ApplicationController

    def index
        @places = Place.all
        @user = current_user
    end

    def new
        @place = Place.new
        @user = current_user
        @owner = @user.owner
    end

    def create
        @place = Place.create(place_params)
        redirect_to places_path(@place)
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

    def destroy
        place = Place.find(params[:id])
        place.destroy
        respond_to do |format|
          format.html { redirect_to places_path, notice: 'place was successfully destroyed.'}
        end
      end

    def all_tags=(name)
        self.tags = names.split(',').map do |name|
            Tag.where(name: name).first
        end
    end 
    
    def all_tags
        tags.map(&:name).join(", ")
    end

    private

    def place_params
        params.require(:place).permit(:name, :location, :phone, :occupancy, :owner_id)
    end 

end
