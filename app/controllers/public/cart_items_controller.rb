class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = current_customer.cart_items
    @total_price = 0
    
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def create
    # binding.pry
    #新しくカートに入れた商品をcart_itemモデルに保存している
    #(cart_item_params)は下で定義しているものが呼び出されている
    @cart_item = CartItem.new(cart_item_params)
    #カートに入れた会員とログインしたcustomer.idは等しい
    @cart_item.customer_id = current_customer.id
    #カートに入れたアイテムを保存する
    @cart_item.save
   
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|#カートに入れた商品全てを取り出している
      if @cart_item.id != cart_item.id #idが異なった時の処理
        if cart_item.item_id == @cart_item.item_id 
           amount = cart_item.amount + @cart_item.amount
           cart_item.update_attribute(:amount, amount)
           @cart_item.delete
        end
      end
    end
     #createアクションが実行された時、遷移されるページをredirect_toとパスで指定する
    redirect_to cart_items_path
  end
  
  
  private 
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :image)
  end
  
end

