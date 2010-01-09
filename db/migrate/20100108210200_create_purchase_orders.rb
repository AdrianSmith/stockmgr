class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders do |t|
      t.integer :supplier_id
      t.text :comment
      t.integer :created_by_user_id
      t.integer :purchase_order_state_id
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_orders
  end
end
