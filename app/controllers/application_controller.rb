class ApplicationController < ActionController::Base
    protect_from_forgery

  def authenticate_active_admin_user!
    authenticate_user!
    unless (current_user.role == "superadmin" || current_user.role == "leader" || current_user.role == "member") && current_user.verified
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
end
