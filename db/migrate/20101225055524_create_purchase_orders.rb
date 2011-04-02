class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders do |t|
      t.integer :supplier_id, :null => false
      t.text :comment
      t.boolean :paid, :default => false, :null => false
      t.boolean :received, :default => false, :null => false
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end
    add_index "purchase_orders", "supplier_id"
  end

  def self.down
    drop_table :purchase_orders
  end
end
