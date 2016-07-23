class EscrowsController < ApplicationController
  def new
    @escrow = Escrow.new
  end

  def create
    unless user_signed_in?
      flash[:error] = "please log in"
      redirect_to :login
    end

    @escrow = Escrow.create(new_escrow_params)
    if @escrow.save
      flash[:notice] = "payment created"
    else
      flash[:error] = "error creating payment"
    end
  end

  def show
    @escrow = Escrow.find(params[:id])
  end

  private
    def new_escrow_params
      params.require(:escrow).permit(:amount)
    end
end
