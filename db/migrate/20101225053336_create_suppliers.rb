class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name, :null => false, :unique => true
      t.text :description
      t.string :website
      t.string :email
      t.string :account_name
      t.string :account_number
      t.text :delivery_rules
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
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
