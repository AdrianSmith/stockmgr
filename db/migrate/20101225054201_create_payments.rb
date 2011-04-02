class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0
      t.integer :payment_type_id, :null => false
      t.integer :customer_id, :null => false
      t.datetime :received_at
      t.text :comment

      t.timestamps
    end
    add_index "payments", "customer_id"
  end


  def self.down
    drop_table :payments
  end
end
