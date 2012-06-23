class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address_line_1
      t.string :address_line_2
      t.string :suburb
      t.string :city
      t.string :postcode
      t.string :phone_mobile
      t.string :phone_home
      t.string :phone_work
      t.decimal :account_balance_cached, :precision => 8, :scale => 2, :default => 0.0
      t.boolean :active, :default => true, :null => false

      t.timestamps
    end
  end
end
