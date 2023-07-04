class CreateOderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_items do |t|
      t.integer :amoumt, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
