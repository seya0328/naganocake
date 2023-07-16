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
    redirect_to my_page_path
    else
      render :edit
    end
  end
    def withdraw
      @customer = Customer.find(current_customer.id)
      @customer.update(is_deleted: true)
      flash[:notice] = "退会処理を行いました"
      redirect_to root_path
    end
    def customer_params
      params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address, :telephone_number,:email)
  
    end
end
