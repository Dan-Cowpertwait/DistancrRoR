class OwnersController < ApplicationController
    before_action :authenticate_user!

    def new
      @owner = Owner.new
    end
  
    def create
      @owner = Owner.create(owner_params)
      @owner.user = current_user
      redirect_to '/user/dashboard' #still need to build routes
    end
  
    def show
      @owner = Owner.find(params[:id])
      @user = current_user
    end

  
    def owner_params
      params.require(:owner).permit(:user_id, :name)
    end 


end
