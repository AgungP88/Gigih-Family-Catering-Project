class CategoryController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @categories = Category.all
  end

  def show
    set_category
  end

  def create
    category = Category.new(
      category_params
    )
    respond_to do |format|
      if (category.valid?)
        @category = Category.create(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.where(id: params[:id]).first
  end

  def update
    @category = Category.where(id: params[:id]).first
    category = Category.new(
      category_params
    )
    
    respond_to do |format|
      if (category.valid?)
        @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully update.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.where(id: params[:id]).first
    @category.destroy
    respond_to do |format|
      format.html { redirect_to category_index_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.where(id: params[:id])
    end
  
    def category_params
      params.require(:category).permit(:name)
    end
end
