class OrderController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @orders = Order.all
  end

  def show
    set_order
  end

  def create
    order = Order.new(
      order_params
    )
    respond_to do |format|
      if (order.valid?)
        @order = Order.create(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @order = Order.new
    @order.order_details.build
    @customer = Customer.all
    @menu = Menu.all
  end

  def edit
    @order = Order.where(id: params[:id]).first
    @customer = Customer.all
    @menu = Menu.all
  end

  def update
    @order = Order.where(id: params[:id]).first
    order = Order.new(
      order_params
    )
    
    respond_to do |format|
      if (order.valid?)
        @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully update.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.where(id: params[:id]).first
    @order.destroy
    respond_to do |format|
      format.html { redirect_to order_index_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.where(id: params[:id])
    end
  
    def order_params
      params.require(:order).permit(:customer_id, :total, :order_date, :status, order_details_attributes: [:id, :menu_id, :quantity, :price])
    end
end
