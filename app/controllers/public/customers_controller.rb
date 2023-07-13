class Public::CustomersController < ApplicationController
  def show
    # @customer = Customer.find(params[:id])
  end
  def edit
    @customer =  current_customer
  end
  def update
    
  end
end
