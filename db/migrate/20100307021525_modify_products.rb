class ModifyProducts < ActiveRecord::Migration
  def self.up 
    rename_column :products, :stock_cost, :purchase_price
  end

  def self.down
    rename_column :products, :purchase_price, :stock_cost
  end
end
