class BountiesController < ApplicationController
  def index
    @bounties = Bounty.all
  end

  def filled
    @bounties = Bounty.all
  end

  def show
    @bounty = Bounty.find(params[:id])

    respond_to do |format|
      format.html { redirect_to root_path(id: params[:id]) }
      format.json { render :json => @bounty.to_json }
    end
  end

  def new
    redirect_to :login unless user_signed_in?
    @bounty = Bounty.new
  end

  def edit
    @bounty = Bounty.find(params[:id])
  end

  def create
    @bounty = current_user.bounties.create(bounty_params)

    if @bounty.save
      redirect_to @bounty
    else
      redirect_to root_path
    end
  end

  def update
    @bounty = Bounty.find(params[:id])
    redirect_to :login unless user_signed_in? and @bounty.user == current_user

    if @bounty.update(bounty_params)
      redirect_to @bounty
    else 
      render 'edit'
    end
  end

  def vote
    if user_signed_in?
      @bounty = Bounty.find(params[:id])
      @bounty.votes.create
      redirect_to :back
    else
      redirect_to :login
      flash[:notice] = "please login"
    end
  end

  def fill
    # for updating a bounty to an artwork
    @bounty = Bounty.find(params[:id])

    if not @bounty[:artist]
      # no artist field = no picture = not yet filled. render form
      render 'fill'
    elsif @bounty.update(artwork_fill_params)
      redirect_to @bounty
    else
      render 'fill'
    end
  end

  def upload
    redirect_to :login unless user_signed_in?
    @bounty = Bounty.new(upload_params)

    if @bounty.save
      redirect_to @bounty
    else
      render 'upload'
    end
  end

  def destroy
    @bounty = Bounty.find(params[:id])
    redirect_to :login unless user_signed_in? and @bounty.user == current_user

    @bounty.destroy

    redirect_to bounties_path
  end

  private
    def bounty_params
      params.require(:bounty).permit(:title,:lat,:lng,
        :amount,:description,:patron)
    end

    def artwork_fill_params
      params.require(:bounty).permit(:artist,:pic,:address)
    end

    def upload_params
      params.require(:bounty).permit(:title,:lat,:lng,
        :description,:artist,:pic,:address)
    end
end
