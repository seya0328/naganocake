class Item < ApplicationRecord
  validates :name, {presence: true}
  validates :introduction, {presence: true}
  validates :price, {presence: true}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_images, dependent: :destroy
  
   #item_imageという名前でActiveStorageで商品画像を保存できるように設定。
  has_one_attached :item_image
  
  def get_item_image
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end 
end
