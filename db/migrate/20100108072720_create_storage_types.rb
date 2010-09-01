class CreateStorageTypes < ActiveRecord::Migration
  def self.up
    create_table :storage_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :storage_types
  end
end
