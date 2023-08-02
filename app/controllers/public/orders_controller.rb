class Public::OrdersController < ApplicationController
  def new
    @order_items = OrderItem.new
    @address = current_customer.address
  end
  
  def log
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
        @order.orders_post_code = current_customer.post_code
        @order.orders_address = current_customer.address
        @order.orders_name = current_customer.last_name + current_member.first_name 
    end    
    if params[:order][:address_option] == "1"
        ship = Address.find(params[:order][:customer_id])
　　　　　　　#orderのmember_id(=カラム)でアドレス(帳)を選び、そのデータ送る
        @order.orders_post_code = ship.post_code
        @order.orders_address = ship.address
        @order.orders_name = ship.name 
    end
    if params[:order][:address_option] = "2"
        @order.shipping_post_code = params[:order][:shipping_post_code]
        @order.shipping_address = params[:order][:shipping_address]
        @order.shipping_name = params[:order][:shipping_name]
        else
          render 'new'
        end
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
        params.require(:order).permit(:postage, :payment_method, :order_name, :order_address, :order_post_code ,:customer_id,:total_payment)
    end
