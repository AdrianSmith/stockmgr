class CreateSalesOrderItems < ActiveRecord::Migration
  def self.up
    create_table :sales_order_items do |t|
      t.integer :sales_order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :custom_price, :precision => 8, :scale => 2, :default => 0.0
      t.boolean :use_custom_price, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_order_items
  end
end
