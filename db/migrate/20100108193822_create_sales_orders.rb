class CreateSalesOrders < ActiveRecord::Migration
  def self.up
    create_table :sales_orders do |t|
      t.integer :user_id
      t.text :comment
      t.integer :created_by_user_id
      t.integer :sales_order_state_id
      t.boolean :is_invoiced
      t.decimal :invoice_amount
      t.timestamp :invoiced_at

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_orders
  end
end
