class CreateSalesOrders < ActiveRecord::Migration
  def self.up
    create_table :sales_orders do |t|
      t.integer :customer_id, :null => false
      t.boolean :ordered, :null => false, :default => false
      t.boolean :invoiced, :null => false, :default => false
      t.boolean :paid, :null => false, :default => false
      t.decimal :invoice_amount, :precision => 8,  :scale => 2, :default => 0.0
      t.datetime :invoiced_at
      t.text :public_comment
      t.text :private_comment

      t.timestamps
    end
    add_index "sales_orders", "customer_id"
  end

  def self.down
    drop_table :sales_orders
  end
end
