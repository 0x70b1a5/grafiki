class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email:params[:email]).first
    if @user.valid_password?(params[:password])
      sign_in(:user,@user)
      flash[:notice] = "login successful"
      redirect_to root_path
    else
      flash[:alert] = "could not login"
      redirect_to login_path
    end
  end

  def destroy
    sign_out(:user,current_user)
    flash[:notice] = "logout complete"
    redirect_to root_path
  end
end
