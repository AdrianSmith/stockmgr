class CreateSalesOrders < ActiveRecord::Migration
  def change
    create_table :sales_orders do |t|
      t.integer :customer_id, :null => false
      t.string :state, :null => false, :default => 'ordered'
      t.date :invoiced_on
      t.date :paid_on
      t.string :private_comment
      t.string :public_comment

      t.timestamps
    end
  end
end
