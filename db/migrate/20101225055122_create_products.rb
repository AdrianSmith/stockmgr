class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, :null => false, :unique => true
      t.text :description
      t.string :supplier_reference
      t.integer :product_type_id, :null => false
      t.integer :supplier_id, :null => false
      t.integer :certifier_id
      t.string :storage_type_id
      t.integer :units_of_measure_id, :null => false
      t.decimal :minimum_quantity, :precision => 8, :scale => 2, :default => 1.0
      t.integer :storage_location_id
      t.integer :physical_form_id
      t.decimal :purchase_price, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.decimal :sale_price, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.boolean :include_gst, :default => true, :null => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
    add_index "products", "supplier_id"
    add_index "products", "product_type_id"
    add_index "products", "certifier_id"
    add_index "products", "storage_type_id"
    add_index "products", "units_of_measure_id"
    add_index "products", "storage_location_id"
    add_index "products", "physical_form_id"
  end

  def self.down
    drop_table :products
  end
end
