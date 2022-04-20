class CustomerController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.where(id: params[:id])
  end

  def create
    customer = Customer.create(params.require(:customer).permit(:name, :phone, :email))

    redirect_to customer_index_path
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.where(id: params[:id]).first
  end

  def update
    customer = Customer.where(id: params[:id]).first
    customer.update(params.require(:customer).permit(:name, :phone, :email))
    redirect_to customer_index_path
  end

  def destroy
    @customer = Customer.where(id: params[:id]).first
    @customer.destroy

    redirect_to customer_index_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :phone, :email)
  end
end
