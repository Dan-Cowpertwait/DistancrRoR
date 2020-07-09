class DashboardController < ApplicationController

    def home
    end

    def welcome
    end 

    def dash
        @user = current_user

        if @user.individual
            @individual = @user.individual
            @visits = @individual.visits

        elsif @user.owner
            @owner = @user.owner

        else
            @individual = @user.individual
            @owner = @user.owner
            
        end
    end

end
