class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email],params[:password])

    if @user
      flash[:notice] = "login successful"
      session[:userid] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "could not login"
      redirect_to login_path
    end
  end

  def destroy
    session[:userid] = nil
    flash[:notice] = "logout complete"
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end

  helper_method :current_user
end
