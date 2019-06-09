class CategoriesController < ApplicationController
  before_action :find_category, only: %i(show update destroy)

  def index
    render json: Category.all
  end

  def create
    category = Category.new(category_params)

    if category.save
      render json: category
    else
      render json: { error: category.errors }, status: 422
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: { error: @category.errors }, status: 422
    end
  end

  def show
    render json: @category
  end

  def destroy
    @category.destroy

    render json: { message: 'success' }
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(Category.allowed_attributes)
  end
end
