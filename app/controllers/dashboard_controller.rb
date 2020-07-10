class DashboardController < ApplicationController

    def home
    end

    def welcome
    end 

    def dash
        if user_signed_in?
        @user = current_user

            if @user.individual && !@user.owner
                @individual = @user.individual
                @visits = @individual.visits
                @places = Place.all

            elsif @user.owner && !@user.individual
                @owner = @user.owner
                @places = @owner.places

            elsif @user.owner && @user.individual
                @individual = @user.individual
                @owner = @user.owner
                @visits = @individual.visits
                @places = @owner.places
            end
        else 
            redirect_to "/welcome"
        end
    end

end
