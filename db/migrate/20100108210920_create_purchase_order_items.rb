class CreatePurchaseOrderItems < ActiveRecord::Migration
  def self.up
    create_table :purchase_order_items do |t|
      t.integer :product_id
      t.integer :purchase_order_id
      t.decimal :quantity, :precision => 12, :scale => 3, :default => 0.0
      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_order_items
  end
end
