class DashboardController < ApplicationController

    def home
    end

    def welcome
    end 

    def dash
        if user_signed_in?
        @user = current_user

            if @user.individual
                @individual = @user.individual
                @visits = @individual.visits

            elsif @user.owner
                @owner = @user.owner
                @places = @owner.places

            elsif
                @individual = @user.individual
                @owner = @user.owner
                
            end
        else 
            redirect_to "/welcome"
        end
    end

end
