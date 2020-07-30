module ApplicationHelper

    def user_is_owner?
        if current_user.owner  && !current_user.individual
            true
        else
            false
        end
    end

    def user_is_individual?
        if current_user.individual && !current_user.owner
            true
        else
            false
        end
    end

    def user_is_both?
        if current_user.owner && current_user.individual
            true
        else
            false
        end 
    end 

    def user_is_neither?
        if !current_user.owner && !current_user.individual
            true
        else
            false
        end 
    end 


end
