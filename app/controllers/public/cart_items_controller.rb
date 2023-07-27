class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = current_customer.cart_items
    @total_price = 0
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
    current_user.books.destroy_all
  end
  
  def create
    binding.pry
    #新しくカートに入れた商品をcart_itemモデルに保存している
    #(cart_item_params)は下で定義しているものが呼び出されている
    @cart_item = CartItem.new(cart_item_params)
    #カートに入れた会員とログインしたcustomer.idは等しい
    @cart_item.customer_id = current_customer.id
    #カートに入れたアイテムを保存する
    @cart_item.save
    #createアクションが実行された時、遷移されるページをredirect_toとパスで指定する
    redirect_to cart_items_path
  end
  
  
  
  private 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :image)
  end
end

