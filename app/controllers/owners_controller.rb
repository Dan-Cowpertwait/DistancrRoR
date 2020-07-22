class OwnersController < ApplicationController
  
    def new
      @owner = Owner.new
    end

    def edit
        @owner = Owner.find(params[:id])
    end
  
    def create
      @owner = Owner.create(owner_params)
      @owner.user = current_user
      if @owner.valid?
      redirect_to new_owner_place_path(@owner)
      else
      redirect_to new_owner_path
      end
    end
  
    def show
      @owner = Owner.find(params[:id])
      @user = current_user
    end

  
    def owner_params
      params.require(:owner).permit(:user_id, :name)
    end 


end
