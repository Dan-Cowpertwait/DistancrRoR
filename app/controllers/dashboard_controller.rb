class DashboardController < ApplicationController

    def home
    end

    def welcome
    end 

    def dash
        if user_signed_in?
            @user = current_user
            if user_is_individual?
                @individual = @user.individual
                @places = Place.all
                @visits = @individual.visits
            elsif user_is_owner?
                @owner = @user.owner
                @places = @owner.places
            elsif user_is_both?
                @individual = @user.individual
                @owner = @user.owner
                @visits = @individual.visits
                @places = @owner.places
            elsif user_is_neither?
                redirect_to "/welcome"
            end
        else
            redirect_to "/"
        end
    end

end
