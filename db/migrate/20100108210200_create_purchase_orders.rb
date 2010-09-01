class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders do |t|
      t.integer :supplier_id
      t.text :comment
      t.boolean :is_paid, :default => false
      t.boolean :is_received, :default => false
      t.integer :created_by_user_id
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_orders
  end
end
