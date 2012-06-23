class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0
      t.integer :payment_type_id, :null => false
      t.integer :customer_id, :null => false
      t.text :comment
      t.datetime :received_at

      t.timestamps
    end
  end
end
