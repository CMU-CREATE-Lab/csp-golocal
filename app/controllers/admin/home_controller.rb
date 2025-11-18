class Admin::HomeController < ApplicationController

  layout "application_back"

  def index
    if not logged_in?
      redirect_to "/user/login"
    end
  end

end
