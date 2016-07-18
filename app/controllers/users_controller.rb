class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save 
      flash[:notice] = "welcome to grafiki"
      flash[:color] = "valid"
    else
      flash[:notice] = "please try again"
      flash[:color] = "invalid" 
    end
    render 'new'
  end
end
