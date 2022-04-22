class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @orders = Order.all
  end

  def show
    @order = Order.where(id: params[:id])
  end

  def create
    order = Order.create(order_params)

    redirect_to order_index_path
  end

  def new
    @order = Order.new
    @order.order_details.build
  end

  def edit
    @order = Order.where(id: params[:id]).first
  end

  def update
    order = Order.where(id: params[:id]).first
    order.update(order_params)
    redirect_to order_index_path
  end

  def destroy
    @order = Order.where(id: params[:id]).first
    @order.destroy

    redirect_to order_index_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total, :order_date, :status, order_details_attributes: [:id, :menu_id, :quantity, :price])
  end
end
