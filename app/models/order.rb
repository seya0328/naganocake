class Order < ApplicationRecord
  has_many :order_items
  has_many :items,through: :order_items#注文には商品が多くある
  
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end

