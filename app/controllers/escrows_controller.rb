class EscrowsController < ApplicationController
  def new
    @escrow = Escrow.new

    if params[:bounty_id]
      @bounty = Bounty.find(params[:bounty_id])
    end
  end

  def create
    unless user_signed_in?
      flash[:error] = "please log in"
      redirect_to root_path
    end

    if params[:art]
      params[:escrow][:owner_token] = params[:stripeToken]
      @escrow = Escrow.create(art_escrow_params)
    else
      @escrow = Escrow.create(new_escrow_params)
    end

    if @escrow.save
      flash[:notice] = "payment created"
      redirect_to @escrow.bounty
    else
      flash[:error] = "error creating payment"
    end
  end

  def update
    unless user_signed_in?
      flash[:error] = "please log in"
      redirect_to root_path
    end

    @escrow = Escrow.find(params[:escrow_id])
    if current_user == @escrow.bounty.user # user is bounty patron
      # pay chosen artist
      # TODO
    else # user is prospective artist
      # add artist to candidates
      if @escrow.status == 0 or @escrow.status == 1
        # artist is nth candidate
        @escrow.users.create(current_user)

        # commit changes
        if @escrow.update(new_candidate_params)
          flash[:notice] = "your art (##{
            @escrow.users.length}) has been submitted"
          redirect_to @escrow
        else
          flash[:error] = "could not save escrow"
        end
      else # bounty is already filled
        flash[:error] = "you cannot fill a complete bounty"
      end
    end
  end

  def show
    @escrow = Escrow.find(params[:id])
    @bounty = @escrow.bounty
    redirect_to @bounty
  end

  private
    def new_escrow_params
      params.require(:escrow).permit(:amount,:token)
    end

    def new_candidate_params
      params.require(:escrow).permit(:user_id,:artist_email,
        :artist_token)
    end

    def art_escrow_params
      params.require(:escrow).permit(:owner_email,:amount,:owner_token,
        :bounty_id)
    end 
end
