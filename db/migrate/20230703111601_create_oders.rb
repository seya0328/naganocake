class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      t.integer :postage, null: false
      t.integer :bill, null: false
      t.integer :payment_method, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.timestamps
    end
  end
end
