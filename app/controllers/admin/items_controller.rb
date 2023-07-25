class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "successfully created."
      redirect_to admin_item_path(@item.id)
    else
      @items = Item.all
      render :index
    end
  end
  
  def show
    @item = Item.find(params[:id])
    
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    
  
  end
  
   private
   
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end