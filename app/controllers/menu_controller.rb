class MenuController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.where(id: params[:id])
  end

  def create
    menu = Menu.create(params.require(:menu).permit(:name, :description, :price, :category_id))

    redirect_to menu_index_path
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.where(id: params[:id]).first
  end

  def update
    menu = Menu.where(id: params[:id]).first
    menu.update(params.require(:menu).permit(:name, :description, :price, :category_id))
    redirect_to menu_index_path
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
