class RemoveInvoicedAmount < ActiveRecord::Migration
  def self.up
    remove_column :sales_orders, :invoice_amount
  end

  def self.down
    add_column :sales_orders, :invoice_amount, :decimal, :precision => 8,  :scale => 2, :default => 0.0
  end
end
