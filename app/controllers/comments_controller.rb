class CommentsController < ApplicationController
  before_action :find_comment, only: %i(show update destroy)

  def index
    render json: Comment.all
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render json: { error: comment.errors }, status: 422
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: { error: @comment.errors }, status: 422
    end
  end

  def show
    render json: @comment
  end

  def destroy
    @comment.destroy

    render json: { message: 'success' }
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(Comment.allowed_attributes)
  end
end
