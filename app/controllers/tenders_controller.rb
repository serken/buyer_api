class TendersController < ApplicationController
  before_action :find_tender, only: %i(update destroy)
  skip_before_action :authenticate_user, only: %w(index show)

  def index
    render json: Tender.all
  end

  def create
    tender = current_user.tenders.new(tender_params)

    if tender.save
      render json: tender
    else
      render json: { error: tender.errors }, status: 422
    end
  end

  def update
    if @tender.update(tender_params)
      render json: @tender
    else
      render json: { error: @tender.errors }, status: 422
    end
  end

  def show
    render json: @tender
  end

  def destroy
    @tender.destroy

    render json: { message: 'success' }
  end

  private

  def find_tender
    @tender = current_user.tenders.find(params[:id])
  end

  def tender_params
    params.require(:tender).permit(Tender.allowed_attributes)
  end
end
