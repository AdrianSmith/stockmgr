class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.text :supplier_reference
      t.integer :product_type_id
      t.integer :supplier_id
      t.integer :certifier_id
      t.integer :storage_type_id
      t.integer :units_of_measure_id
      t.integer :minimum_quantity
      t.integer :storage_location_id
      t.integer :physical_form_id
      t.decimal :stock_quantity
      t.decimal :stock_cost, :precision => 8, :scale => 2, :default => 0.0
      t.decimal :sale_price, :precision => 8, :scale => 2, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
