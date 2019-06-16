class ProposalsController < ApplicationController
  before_action :find_proposal, only: %i(show update destroy)
  before_action :find_tender, only: %i(create)

  def index
    render json: Proposal.all
  end

  def create
    proposal = Proposal.new(proposal_params)

    if proposal.save
      render json: proposal
    else
      render json: { error: proposal.errors }, status: 422
    end
  end

  def update
    if @proposal.update(proposal_params)
      render json: @proposal
    else
      render json: { error: @proposal.errors }, status: 422
    end
  end

  def show
    render json: @proposal
  end

  def destroy
    @proposal.destroy

    render json: { message: 'success' }
  end

  private

  def find_tender
    current_user.tenders.find(params[:tender_id])
  end

  def find_proposal
    @proposal = current_user.proposals.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(Proposal.allowed_attributes)
  end
end
