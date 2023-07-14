class Public::CustomersController < ApplicationController
  def show
    # @customer = Customer.find(params[:id])
  end
  def edit
    @customer =  current_customer
  end
  def update
    @customer = current_customer
    if @customer.update(customer_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to customer_session_path(@customer.id)
    else
      render :edit
    end
  end
end
