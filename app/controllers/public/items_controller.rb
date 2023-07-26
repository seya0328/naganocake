class Public::ItemsController < ApplicationController
  
  def index
    #@itemsに商品の全てが保存されている
     @items = Item.all
  end
  
  def show
    #URLのアイテムのidをparamsが拾って、findでその数字を指定して、その数字がveiwでも適応されて表示される
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def item_params
    params.require(:item).permit(:image_id, :name, :introduction, :price, :amount)
  end
end