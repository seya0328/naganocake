class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  def show
    @customers = Customer.find(params[:id])
  end 
  def edit
    @customers = Customer.find(params[:id])
  end
  def update
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:id, :name, :email, :is_deleted)
  end
end
