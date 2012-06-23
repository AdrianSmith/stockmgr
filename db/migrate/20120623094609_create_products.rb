class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.integer :product_type_id, :null => false
      t.text :description
      t.integer :supplier_id, :null => false
      t.string :supplier_reference
      t.string :brand
      t.decimal :purchase_price, :precision => 8, :scale => 2, :default => 0.0, :null => false
      t.boolean :gst, :null => false, :default => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
