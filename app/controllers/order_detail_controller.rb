class OrderDetailController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @order_details = OrderDetail.all
  end

  def show
    set_order_detail
  end

  def create
    order_detail = OrderDetail.new(
      order_detail_params
    )
    respond_to do |format|
      if (order_detail.valid?)
        @order_detail = OrderDetail.create(order_detail_params)
        format.html { redirect_to @order_detail, notice: 'Order Detail was successfully created.' }
        format.json { render :show, status: :created, location: @order_detail }
      else
        format.html { render :new }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @order_detail = OrderDetail.new
  end

  def edit
    @order_detail = OrderDetail.where(id: params[:id]).first
  end

  def update
    @order_detail = OrderDetail.where(id: params[:id]).first
    order_detail = OrderDetail.new(
      order_detail_params
    )
    
    respond_to do |format|
      if (order_detail.valid?)
        @order_detail.update(order_detail_params)
        format.html { redirect_to @order_detail, notice: 'Order Detail was successfully update.' }
        format.json { render :show, status: :created, location: @order_detail }
      else
        format.html { render :new }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_detail = OrderDetail.where(id: params[:id]).first
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_detail_index_path, notice: 'Order Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order_detail
      @order_detail = OrderDetail.where(id: params[:id])
    end
  
    def order_detail_params
      params.require(:order_detail).permit(:order_id, :menu_id, :quantity, :price)
    end
end
