class BountiesController < ApplicationController
  def index
    @bounties = Bounty.all
  end

  def show
    @bounty = Bounty.find(params[:id])
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

  def destroy
    @bounty = Bounty.find(params[:id])
    @bounty.destroy

    redirect_to bounties_path
  end
  private
    def bounty_params
      params.require(:bounty).permit(:title,:lat,:lng,:amount,:desc)
    end
end
