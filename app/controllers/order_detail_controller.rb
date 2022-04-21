class OrderDetailController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.where(id: params[:id])
  end

  def create
    order_detail = OrderDetail.create(params.require(:order_detail).permit(:order_id, :menu_id, :quantity, :price))

    redirect_to order_detail_index_path
  end

  def new
    @order_detail = OrderDetail.new
  end

  def edit
    @order_detail = OrderDetail.where(id: params[:id]).first
  end

  def update
    order_detail = OrderDetail.where(id: params[:id]).first
    order_detail.update(params.require(:order_detail).permit(:order_id, :menu_id, :quantity, :price))
    redirect_to order_detail_index_path
  end

  def destroy
    @order_detail = OrderDetail.where(id: params[:id]).first
    @order_detail.destroy

    redirect_to order_detail_index_path
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:order_id, :menu_id, :quantity, :price)
  end
end
