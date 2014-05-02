class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end

    add_index :cart_items, :user_id
    add_index :cart_items, :product_id
    add_index :cart_items, [:user_id, :product_id], unique: true
  end
end
