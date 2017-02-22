class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
   # For additional fields in app/views/devise/registrations/new.html.erb
   # ok de le rajouter dans le form
   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :photo, :video])
 end
end
