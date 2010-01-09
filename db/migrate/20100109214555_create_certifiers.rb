class CreateCertifiers < ActiveRecord::Migration
  def self.up
    create_table :certifiers do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :logo_image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :certifiers
  end
end
