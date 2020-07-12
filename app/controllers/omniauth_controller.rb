class OmniauthController < Devise::OmniauthCallbacksController

    def facebook
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in(@user)
            redirect_to '/welcome'
            set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        else
            flash[:error] = 'There was a problem signing you in!'
            redirect_to new_user_registration_url
        end
    end

    def google_oauth2
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            # decided to use persist rather than save, to avoid user conflicts
            sign_in(@user)
            redirect_to '/welcome'
            set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
        else
            flash[:error] = 'There was a problem signing you in!'
            redirect_to new_user_registration_url
        end
    end 

    def failure
        flash[:error] = "There was a problem signing you in with this service, please try again later"
        redirect_to "/welcome"
    end

    protected

    

end