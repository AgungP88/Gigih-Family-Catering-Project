class MenuController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @menus = Menu.all
  end

  def show
    set_menu
  end

  def create
    menu = Menu.new(
      menu_params
    )
    respond_to do |format|
      if (menu.valid?)
        @menu = Menu.create(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @menu = Menu.new
    @category = Category.all
  end

  def edit
    @menu = Menu.where(id: params[:id]).first
    @category = Category.all
  end

  def update
    @menu = Menu.where(id: params[:id]).first
    menu = Menu.new(
      menu_params
    )
    
    respond_to do |format|
      if (menu.valid?)
        @menu.update(menu_params)
        format.html { redirect_to @menu, notice: 'Menu was successfully update.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu = Menu.where(id: params[:id]).first
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menu_index_path, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_menu
      @menu = Menu.where(id: params[:id])
    end
  
    def menu_params
      params.require(:menu).permit(:name, :description, :price, :category_id)
    end
end
