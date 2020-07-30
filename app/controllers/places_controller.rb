class PlacesController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :place_belongs_to_user?, only: [:update, :edit, :destroy]

    def index
        @user = current_user
        if params[:owner_id] && !Owner.exists?(params[:owner_id])
            redirect_to "/dashboards"
        elsif params[:owner_id]
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
        @place = Place.create(place_params)
        owner = Owner.find_by(id: params[:owner_id])
        if @place.valid? 
            redirect_to "/dashboard"
        else
            redirect_to new_owner_place_path(owner)
        end
    end

    def show
        @place = Place.find(params[:id])
        @user = current_user
        @visits = @place.visits
        if user_is_individual?
            @individual = @user.individual
            @visits = @individual.visits
        elsif user_is_owner?
            @owner = @user.owner
        elsif user_is_both?
            @individual = @user.individual
            @owner = @user.owner
        end
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
        @owner = Owner.find_by(id: params[:owner_id])
        @place = Place.find(params[:id])
        if @place.valid?
            @place.update(place_params)
            @place.save
            redirect_to place_path(@place)
        else
            redirect_to edit_owner_place_path(@owner, @place)
        end
    end

    def destroy
        place = Place.find(params[:id])
        place.destroy
        respond_to do |format|
          format.html { redirect_to "/dashboard", notice: 'place was successfully destroyed.'}
        end
    end

    def search
        @user = current_user
        @individual = @user.individual
        @places = Place.search(params[:q])
    end

    private

    def place_belongs_to_user?
        if current_user.owner != Place.find(params[:id]).owner
        redirect_to "/dashboard"
        end
    end 

    def place_params
        params.require(:place).permit(:name, :location, :phone, :occupancy, :owner_id, :image)
    end 

end
