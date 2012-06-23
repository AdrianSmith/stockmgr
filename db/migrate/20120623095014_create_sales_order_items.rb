class CreateSalesOrderItems < ActiveRecord::Migration
  def change
    create_table :sales_order_items do |t|
      t.integer :sales_order_id, :null => false
      t.integer :product_id, :null => false
      t.decimal :quantity, :null => false, :precision => 12, :scale => 3, :default => 0.0

      t.timestamps
    end
  end
end
