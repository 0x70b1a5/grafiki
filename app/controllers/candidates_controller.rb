class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    unless user_signed_in?
      redirect_to :login
    end

    @escrow = Escrow.find(params[:escrow_id])
    @candidate = @escrow.candidates.create(candidate_params)

    if @candidate.save
      flash[:notice] = "submission saved"
      redirect_to @escrow.bounty
    else
      flash[:error] = "error creating submission"
      redirect_to @escrow.bounty
    end
  end

  private
    def candidate_params
      params.require(:candidate).permit(:email,:address,:pic,:artist)
    end
end
