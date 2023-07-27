class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  ## 小計を求めるメソッドtax_priceは税込価格、*は×（かける）amount(数量)
  def subtotal
    item.with_tax_price * amount
  end

end
