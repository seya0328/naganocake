class Public::ItmesController < ApplicationController
  def index
     @items = Item.all
  end
end