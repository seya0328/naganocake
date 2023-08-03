class Public::OrdersController < ApplicationController
  def new
    @order_items = OrderItem.new
    @order = Order.new
  end
  
  def log
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name 
        
    elsif params[:order][:address_option] == "1"
        ship = Address.find(params[:order][:customer_id])#orderのmember_id(=カラム)でアドレス(帳)を選び、そのデータ送る
        @order.postal_code = ship.postal_code
        @order.address = ship.address
        @order.name = ship.name 
    
    elsif params[:order][:address_option] = "2"
        @order.postal_code = params[:order][:shipping_post_code]
        @order.address = params[:order][:shipping_address]
        @order.name = params[:order][:shipping_name]
    else
      render 'new'
    end
  end
  
  def thanx
    
  end
  
  def index
    
  end
  
  def show
  end
  
  private
    def order_params
        params.require(:order).permit(:postage, :payment_method, :name, :address, :postal_code ,:customer_id,:total_payment)
    end
end
