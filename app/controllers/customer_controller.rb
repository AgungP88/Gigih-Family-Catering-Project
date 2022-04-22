class CustomerController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @customers = Customer.all
  end

  def show
    set_customer
  end

  def create
    customer = Customer.new(
      customer_params
    )
    respond_to do |format|
      if (customer.valid?)
        @customer = Customer.create(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.where(id: params[:id]).first
  end

  def update
    @customer = Customer.where(id: params[:id]).first
    customer = Customer.new(
      customer_params
    )
    
    respond_to do |format|
      if (customer.valid?)
        @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully update.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer = Customer.where(id: params[:id]).first
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customer_index_path, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.where(id: params[:id])
    end
  
    def customer_params
      params.require(:customer).permit(:name, :phone, :email)
    end
end
