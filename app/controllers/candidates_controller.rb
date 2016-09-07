class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.create(candidate_params)

    if @candidate.save!
      flash[:notice] = "submission saved"
    else
      flash[:error] = "error creating submission"
    end
  end

  private
    def candidate_params
      params.require(:candidate).permit(:email,:address,:pic,:artist)
    end
end
