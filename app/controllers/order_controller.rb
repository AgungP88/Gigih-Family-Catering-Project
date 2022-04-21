class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @orders = Order.all
  end

  def show
    @order = Order.where(id: params[:id])
  end

  def create
    order = Order.create(params.require(:order).permit(:customer_id, :total, :order_date))

    redirect_to order_index_path
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.where(id: params[:id]).first
  end

  def update
    order = Order.where(id: params[:id]).first
    order.update(params.require(:order).permit(:customer_id, :total, :order_date, :status))
    redirect_to order_index_path
  end

  def destroy
    @order = Order.where(id: params[:id]).first
    @order.destroy

    redirect_to order_index_path
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :total, :order_date, :status)
  end
end
