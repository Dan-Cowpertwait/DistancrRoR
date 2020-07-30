class IndividualsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :owner_belongs_to_user?, only: [:update, :edit, :destroy]

    def index
        @individual = Individual.all
        @user = current_user
      end
    
      def new
        @individual = Individual.new
      end
    
      def create
        @individual = Individual.create(individual_params)
        @individual.user = current_user
        if @individual.valid?
          redirect_to '/dashboard'
        else
          redirect_to new_individual_path
        end
      end
    
      def show
        @individual = Individual.find(params[:id])
        @user = current_user
        @visit = Visit.new
      end
    
      def edit
        @individual = Individual.find(params[:id])
      end
    
      def update
        @individual = Individual.find(params[:id])
        if @individual.valid?
            @individual.update(individual_params)
            @individual.save
            redirect_to "/dashboard"
        else
            redirect_to edit_individual_path(@individual)
        end
      end
    
      private

      def individual_belongs_to_user?
        if current_user != Individual.find(params[:id]).user
        redirect_to root_path
        end
      end 
    
        def individual_params
            params.require(:individual).permit(:first_name, :last_name, :phone, :dob, :user_id, :profile_pic)
        end 

end
