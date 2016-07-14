class BountiesController < ApplicationController
  def index
    @bounties = Bounty.all
  end

  def show
    @bounty = Bounty.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @bounty.to_json }
    end
  end

  def new
    @bounty = Bounty.new
  end

  def edit
    @bounty = Bounty.find(params[:id])
  end

  def create
    @bounty = Bounty.new(bounty_params)

    if @bounty.save
      redirect_to @bounty
    else
      render 'new'
    end
  end

  def update
    @bounty = Bounty.find(params[:id])

    if @bounty.update(bounty_params)
      redirect_to @bounty
    else 
      render 'edit'
    end
  end

  def vote
    @bounty = Bounty.find(params[:id])
    @bounty.votes.create
    redirect_to bounties_path
  end

  def fill
    # for updating a bounty to an artwork
    @bounty = Bounty.find(params[:id])

    if not @bounty[:artist]
      # no artist field = no picture = not yet filled. render form
      render 'fill'
    elsif @bounty.update(artwork_fill_params)
      # todo: /bounty/x shows main page centered on bounty
      redirect_to @bounty
    else
      render 'fill'
    end
  end

  def destroy
    @bounty = Bounty.find(params[:id])
    @bounty.destroy

    redirect_to bounties_path
  end

  private
    def bounty_params
      params.require(:bounty).permit(:title,:lat,:lng,:amount,:description,
        :patron,:artist,:pic,:address)
    end

    def artwork_fill_params
      params.require(:bounty).permit(:artist,:pic,:address)
    end
end
