class EscrowsController < ApplicationController
  def new
    @escrow = Escrow.new
  end

  def create
    unless user_signed_in?
      flash[:error] = "please log in"
      redirect_to :login
    end

    @escrow = current_user.escrows.create(new_escrow_params)
    if @escrow.save
      flash[:notice] = "payment created"
      redirect_to 'bounties'+@escrow.bounty_id
    else
      flash[:error] = "error creating payment"
      redirect_to root_path
    end
  end

  def show
    @escrow = Escrow.find(params[:id])

    respond_to do |format|
      format.json { render :json => @escrow.to_json }
    end
  end

  private
    def new_escrow_params
      params.require(:escrow).permit(:amount,:currency,:patron_id,:bounty_id)
    end
end
