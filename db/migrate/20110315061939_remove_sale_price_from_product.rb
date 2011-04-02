class RemoveSalePriceFromProduct < ActiveRecord::Migration
  def self.up
    remove_column :products, :sale_price
  end

  def self.down
    add_column :products, :sale_price, :decimal, :precision => 8, :scale => 2, :default => 0.0, :null => false
  end
end
