class CreateStorageTypes < ActiveRecord::Migration
  def self.up
    create_table :storage_types do |t|
      t.string :name, :null => false, :unique => true
      t.text :description
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :storage_types
  end
end
