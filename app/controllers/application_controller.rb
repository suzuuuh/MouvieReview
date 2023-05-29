class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    public_homes_about_path
  end

  def after_sign_out_path_for(resource)
    public_homes_about_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :profile_image, :age, :sex, :is_deleted])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
