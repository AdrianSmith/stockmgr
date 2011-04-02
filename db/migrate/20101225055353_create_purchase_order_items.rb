class CreatePurchaseOrderItems < ActiveRecord::Migration
  def self.up
    create_table :purchase_order_items do |t|
      t.integer :product_id, :null => false
      t.integer :purchase_order_id, :null => false
      t.decimal :quantity, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_order_items
  end
end
