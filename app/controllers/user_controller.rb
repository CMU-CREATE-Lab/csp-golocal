class UserController < ApplicationController

  def post_login
    #render :inline => params
    user = login(params[:username], params[:pwd], params[:remember_me])
    #render :inline => {"params" => params, "user" => user}
    if user
      # actions
      #render :inline => params
      redirect_back_or_to "/user/home"
    else
      flash.now.alert = "Username or password was invalid"
      render :user_login
    end
  end

  def user_login
    if current_user
      redirect_to "/user/home"
    end
  end

  def user_logout
    logout
    redirect_to "/user/login"
  end

  def home
    if not logged_in?
      redirect_to "/user/login"
    end
  end

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end
end
