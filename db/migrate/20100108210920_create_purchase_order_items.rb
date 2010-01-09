class CreatePurchaseOrderItems < ActiveRecord::Migration
  def self.up
    create_table :purchase_order_items do |t|
      t.integer :product_id
      t.decimal :quantity
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_order_items
  end
end
