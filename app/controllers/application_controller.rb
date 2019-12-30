class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_active_admin_user!
    authenticate_user!
    unless (current_user.role == "superadmin" || current_user.role == "leader" || current_user.role == "member") && current_user.verified
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :role, :country, :verified,
                                                       :phone_number, :dob, :gender, :education_level, :specialization, :about])
  end
end
