class CreateStorageLocations < ActiveRecord::Migration
  def self.up
    create_table :storage_locations do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :storage_locations
  end
end
