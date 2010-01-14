class ExtendUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :is_staff, :boolean, :default => false
    add_column :users, :is_customer, :boolean, :default => true
    
    add_column :users, :account_balance_cached, :decimal, :precision => 8, :scale => 2, :default => 0.0
    add_column :users, :percentage_discount, :integer, :limit => 3, :default => 0
    add_column :users, :lock_version, :integer, :default => 0
    
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :suburb_town, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :postcode, :string
    add_column :users, :country, :string
                               
    add_column :users, :phone_mobile, :string
    add_column :users, :phone_home, :string
    add_column :users, :phone_work, :string
  end

  def self.down
    remove_column :users, :is_admin
    remove_column :users, :is_supplier
    remove_column :users, :is_customer
    
    remove_column :users, :account_balance_cached
    remove_column :users, :percentage_discount
    remove_column :users, :lock_version

    remove_column :users, :address_line_1
    remove_column :users, :address_line_2
    remove_column :users, :suburb_town
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :postcode
    remove_column :users, :country
                               
    remove_column :users, :phone_mobile
    remove_column :users, :phone_home
    remove_column :users, :phone_work
  end
end
