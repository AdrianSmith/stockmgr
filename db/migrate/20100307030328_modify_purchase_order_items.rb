class ModifyPurchaseOrderItems < ActiveRecord::Migration
  def self.up
    change_column :purchase_order_items, :quantity, :decimal
  end

  def self.down
    change_column :purchase_order_items, :quantity, :integer
  end
end
