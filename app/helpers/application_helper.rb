module ApplicationHelper

    def user_is_owner?
        @user = current_user
        if @user.owner
            true
        else
            false
        end
    end

    def user_is_individual?
        @user = current_user
        if @individualw
            true
        else
            false
        end
    end

    def user_is_both?
        @user = current_user
        if current_user.owner && current_user.individual
            true
        else
            false
        end 
    end 


end
