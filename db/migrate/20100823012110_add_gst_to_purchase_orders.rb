class AddGstToPurchaseOrders < ActiveRecord::Migration
  def self.up
    add_column :purchase_orders, :include_gst, :boolean
  end

  def self.down
    remove_column :purchase_orders, :include_gst
  end
end
