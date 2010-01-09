class CreateProductPrices < ActiveRecord::Migration
  def self.up
    create_table :product_prices do |t|
      t.integer :product_id
      t.decimal :amount
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :product_prices
  end
end
