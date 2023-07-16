class Public::ItmesController < ApplicationController
  def index
     @items = Item.all
  end
  def show
    
    
  end
end