class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0
      t.integer :payment_type_id
      t.integer :user_id
      t.integer :created_by_user_id
      t.timestamp :received_at
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
