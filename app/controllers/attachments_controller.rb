class AttachmentsController < ApplicationController
  before_action :find_attachment, only: %i(show update destroy)

  def index
    render json: Attachment.all
  end

  def create
    attachment = Attachment.new(attachment_params)

    if attachment.save
      render json: attachment
    else
      render json: { error: attachment.errors }, status: 422
    end
  end

  def update
    if @attachment.update(attachment_params)
      render json: @attachment
    else
      render json: { error: @attachment.errors }, status: 422
    end
  end

  def show
    render json: @attachment
  end

  def destroy
    @attachment.destroy

    render json: { message: 'success' }
  end

  private

  def find_attachment
    @attachment = Attachment.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(Attachment.allowed_attributes)
  end
end
