class MenuController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.where(id: params[:id])
  end

  def create
    menu = Menu.new(
      menu_params
    )

    if (menu.valid?)
      @menu = Menu.create(params.require(:menu).permit(:name, :description, :price, :category_id))

      redirect_to menu_index_path
    else
      render :template => 'menu/new'
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

    if (menu.valid?)
      @menu.update(params.require(:menu).permit(:name, :description, :price, :category_id))
      redirect_to menu_index_path
    else
      render :action => 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @menu = Menu.where(id: params[:id]).first
    @menu.destroy

    redirect_to menu_index_path
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :description, :price, :category_id)
  end
end
