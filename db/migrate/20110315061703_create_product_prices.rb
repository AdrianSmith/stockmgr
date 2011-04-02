class CreateProductPrices < ActiveRecord::Migration
  def self.up
    create_table :product_prices do |t|
      t.integer :product_id, :null => false
      t.decimal :amount, :precision => 8, :scale => 2, :default => 0.0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :product_prices
  end
end
