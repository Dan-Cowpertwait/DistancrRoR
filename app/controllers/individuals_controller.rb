class IndividualsController < ApplicationController
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
        redirect_to '/user/dashboard' #still need to build routes
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
        @individual.update(individual_params)
        @individual.save
        redirect_to individual_path(@individual)
      end
    
      private
    
        def individual_params
            params.require(:individual).permit(:first_name, :last_name, :phone, :dob, :user_id)
        end 

end
