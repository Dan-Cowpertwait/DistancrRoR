class OwnersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :owner_belongs_to_user?, only: [:update, :edit, :destroy]

    def new
      @owner = Owner.new
    end

    def edit
        @owner = Owner.find(params[:id])
    end

    def update
      @owner = Owner.find(params[:id])
      if @owner.valid?
          @owner.update(owner_params)
          @owner.save
          redirect_to "/dashboard"
      else
          redirect_to edit_owner_path(@owner)
      end
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


    
    private
    
    def owner_belongs_to_user?
      if current_user != Owner.find(params[:id]).user
        redirect_to root_path
      end
      end 
      
      def owner_params
        params.require(:owner).permit(:user_id, :name)
      end 

end
