class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to "/user/login"
  end

end
