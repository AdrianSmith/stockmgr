class CreateSalesOrderStates < ActiveRecord::Migration
  def self.up
    create_table :sales_order_states do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_order_states
  end
end
