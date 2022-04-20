class CategoryController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(id: params[:id])
  end

  def create
    category = Category.create(params.require(:category).permit(:name))

    redirect_to category_index_path
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.where(id: params[:id]).first
  end

  def update
    category = Category.where(id: params[:id]).first
    category.update(params.require(:category).permit(:name))
    redirect_to category_index_path
  end

  def destroy
    @category = Category.where(id: params[:id]).first
    @category.destroy

    redirect_to category_index_path
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
