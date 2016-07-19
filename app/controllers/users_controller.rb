class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:notice] = "welcome to grafiki"
      flash[:color] = "valid"
    else
      flash[:notice] = "please try again"
      flash[:color] = "invalid" 
    end
    render 'new'
  end

  def show
  end

  private
    def user_params
      params.require(:user).permit(:username,:password,
        :password_confirmation, :email)
    end
end
