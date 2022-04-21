class OrderDetailController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @order_details = OrderDetail.all
  end

  def show
    @order_detail = OrderDetail.where(id: params[:id])
  end

  def new
    @order_detail = OrderDetail.new
  end

  def edit
    @order_detail = OrderDetail.where(id: params[:id]).first
  end
end
