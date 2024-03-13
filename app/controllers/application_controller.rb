class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def hosted_app?
    ENV["HOSTED"] == "true"
  end
  helper_method :hosted_app?

  protected

  def configure_permitted_parameters
    puts ">>> Here are the parameters: ", params

    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name ])
  end
end
