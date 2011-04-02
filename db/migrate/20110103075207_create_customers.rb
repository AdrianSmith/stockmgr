class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email
      t.string :address_line_1
      t.string :address_line_2
      t.string :suburb_town
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country
      t.string :phone_mobile
      t.string :phone_home
      t.string :phone_work
      t.text :comment
      t.decimal :account_balance_cached, :precision => 8, :scale => 2, :default => 0.0
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
