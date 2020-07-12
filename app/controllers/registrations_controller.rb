class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_up_path_for(resource)
      '/welcome'
    end

    def after_sign_in_path_for(resource)
      '/dashboard'
    end
end
