class AddPublicPrivateCommentFieldsToSalesOrders < ActiveRecord::Migration
  def self.up
    rename_column :sales_orders, :comment, :private_comment
    add_column :sales_orders, :public_comment, :text
  end

  def self.down
    rename_column :sales_orders, :private_comment, :comment
    remove_column :sales_orders, :public_comment
  end
end
