class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.integer :price
      t.integer :shopping_cart_id
      t.integer :product_id
      t.integer :order_id
      t.timestamps
    end
  end
end
