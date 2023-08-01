class Admin::OrdersController < ApplicationController
  def show
     @customers = Customer.find(params[:id])
     @orders = Oder.find(params[:id])
  end
end
