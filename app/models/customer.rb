class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items,dependent: :destroy
  has_many :orders,dependent: :destroy
   # モデルに制約をかける
   #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設けています。
   # is_deletedがfalseならtrueを返すようにしている      
   def active_for_authentication?
    super && (is_deleted == false)
   end
   def full_name
     last_name + first_name
   end
end
