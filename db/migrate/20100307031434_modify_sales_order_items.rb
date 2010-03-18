class ModifySalesOrderItems < ActiveRecord::Migration
  def self.up
    change_column :sales_order_items, :quantity, :decimal
  end

  def self.down
    change_column :sales_order_items, :quantity, :integer
  end
end
