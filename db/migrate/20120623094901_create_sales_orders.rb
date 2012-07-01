class CreateSalesOrders < ActiveRecord::Migration
  def change
    create_table :sales_orders do |t|
      t.integer :customer_id, :null => false

      t.boolean :invoiced
      t.datetime :invoiced_at

      t.boolean :paid
      t.datetime :paid_at

      t.text :private_comment
      t.text :public_comment

      t.timestamps
    end
  end
end
