class AddMissingIndexes < ActiveRecord::Migration
  def self.up
    add_index "payments", "payment_type_id"
    add_index "payments", "customer_id"
    add_index "products", "supplier_id"
    add_index "products", "product_type_id"
    add_index "product_prices", "product_id"
    add_index "sales_orders", "customer_id"
    add_index "sales_order_items", "product_id"
    add_index "sales_order_items", "sales_order_id"
  end

  def self.down
    remove_index "payments", "payment_type_id"
    remove_index "payments", "customer_id"
    remove_index "products", "supplier_id"
    remove_index "products", "product_type_id"
    remove_index "product_prices", "product_id"
    remove_index "sales_orders", "customer_id"
    remove_index "sales_order_items", "product_id"
    remove_index "sales_order_items", "sales_order_id"
  end
end