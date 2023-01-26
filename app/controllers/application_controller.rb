class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def get_avatar(resource)
        resource.avatar.attached? ? resource.avatar.variant(:thumb) : "default_avatar"
    end
    helper_method :get_avatar

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
    end

end
