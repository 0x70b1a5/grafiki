class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @escrow = Escrow.find(params[:escrow_id])
    @candidate = @escrow.candidates.create(candidate_params)

    unless (user_signed_in? and @escrow.bounty.user != current_user)
      redirect_to "/users/sign_in"
    end

    if @candidate.save
      flash[:notice] = "submission saved"
      redirect_to @escrow.bounty
    else
      flash[:error] = "error creating submission"
      redirect_to fill_bounty_path @escrow.bounty.id
    end
  end

  private
    def candidate_params
      params.require(:candidate).permit(:email,:address,:pic,:artist)
    end
end
