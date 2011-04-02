class ModifySalesOrderItems < ActiveRecord::Migration
  def self.up
    remove_column :sales_order_items, :custom_price
    remove_column :sales_order_items, :use_custom_price
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
