class CreateCertifiers < ActiveRecord::Migration
  def self.up
    create_table :certifiers do |t|
      t.string :name, :null => false, :unique => true
      t.text :description
      t.string :website
      t.string :logo_image_url
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :certifiers
  end
end
