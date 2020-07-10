class OwnersController < ApplicationController
    # before_action :authenticate_user!

    def new
      @owner = Owner.new
    end

    def edit
        @owner = Owner.find(params[:id])
    end
  
    def create
      @owner = Owner.create(owner_params)
      @owner.user = current_user
      redirect_to new_owner_place_path(@owner)
      # redirect_to new_place_path
    end
  
    def show
      @owner = Owner.find(params[:id])
      @user = current_user
    end

  
    def owner_params
      params.require(:owner).permit(:user_id, :name)
    end 


end
