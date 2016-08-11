class BountiesController < ApplicationController
  def index
    @bounties = Bounty.all

    respond_to do |format|
      format.html 
      format.json { render :json => @bounties.to_json }
    end
  end

  def filled
    @bounties = Bounty.all # we filter for artwork at the template level
  end

  def show
    @bounty = Bounty.find(params[:id])

    respond_to do |format|
      format.html { redirect_to root_path(id: params[:id]) }
      format.json { render :json => @bounty.to_json }
      format.txt { render :txt => @bounty.to_json }
    end
  end

  def new
    @bounty = Bounty.new
  end

  def edit
    @bounty = Bounty.find(params[:id])
    if not (current_user and @bounty.in? current_user.bounties)
      flash[:error] = "you do not own this bounty"
      redirect_to :bounties
    end
  end

  def create
    unless user_signed_in?
      flash[:error] = "you must log in\nto create a bounty"
      redirect_to "/users/sign_in"
    end

    @bounty = current_user.bounties.create(bounty_params)

    if @bounty.save
      @bounty.escrows.create({
        :amount=>params[:bounty][:amount],
        :owner_token =>params[:stripeToken],
        :owner_email =>params[:stripeEmail]
      })
      if @bounty.save 
        redirect_to @bounty
      else
        flash[:error] = "escrow could not be created"
      end
    else
      flash[:error] = "invalid bounty"
      redirect_to new_bounty_path
    end
  end

  def award# does this code ever actually run?
    if params[:id] #GET
    @bounty = Bounty.find(params[:id])
    unless @bounty.user == current_user
      flash[:error] = "you do not own this bounty"
      redirect_to root_path
    end

    @escrows = @bounty.escrows
    @candidates = @escrows.map {|e| e.candidates}.to_a

    else#POST
    if @bounty.update(artwork_fill_params) and @bounty.save!
      flash[:notice] = "success!"
    else
      flash[:error] = "could not update bounty"
      redirect_to @bounty
    end
    end
  end

  def update
    @bounty = Bounty.find(params[:id])
    unless (user_signed_in? and @bounty.user == current_user)
      flash[:error] = "you do not own this bounty"
      redirect_to "/users/sign_in" 
    end

    if params[:award]
      if @bounty.update(artwork_fill_params) and @bounty.save!
        flash[:notice] = "success!"
        redirect_to @bounty
      else
        flash[:error] = "could not award candidate"
        redirect_to @bounty
      end
    else
      if @bounty.update(bounty_params)
        redirect_to @bounty
      else 
        redirect_to edit_bounties_path
      end
    end
  end

  def vote
    if user_signed_in?
      @bounty = Bounty.find(params[:id])
      if not current_user.in? @bounty.votes
        @bounty.votes.create(user: current_user)
        redirect_to :back
      else
        flash[:error] = "you cannot vote twice"
        redirect_to root_path
      end
    else
      redirect_to "/users/sign_in"
      flash[:notice] = "please login"
    end
  end

  def fill
    # for updating a bounty to an artwork
    redirect_to "/users/sign_in" unless user_signed_in?

    @bounty = Bounty.find(params[:id])
    @escrow = @bounty.escrows.first
    @candidate = Candidate.new

    if not @bounty[:artist] # GET
      # no artist field = no picture = not yet filled. render form
    elsif @escrow.candidates.create(candidate_params) # POST
      # CHECK: does this code ever actually run?
      flash[:notice] = "submission received"
      redirect_to @bounty
    else
      flash[:error] = "error filling bounty"
    end
  end

  def upload
    #TODO this entire form
    redirect_to '/users/sign_in' unless user_signed_in?

    if params[:bounty] # POST
      @bounty = Bounty.new(upload_params)

      if @bounty.save
        flash[:notice] = "artwork uploaded"
        redirect_to @bounty
      else
        flash[:notice] = "problem uploading artwork"
        redirect_to bounties_upload_path
      end
    else # GET
      @bounty = Bounty.new
    end
  end

  def destroy
    @bounty = Bounty.find(params[:id])
    unless (user_signed_in? and @bounty.user == current_user)
      redirect_to "/users/sign_in" 
    end

    @bounty.destroy

    redirect_to bounties_path
  end

  private
    def bounty_params
      stripe_params unless params[:upload]
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

    def stripe_params
      params.require(:stripeToken)
      params.require(:stripeTokenType)
      params.require(:stripeEmail)
    end

    def candidate_params
      params.require(:candidate).permit(:email,:address,:pic,:artist)
    end
end
