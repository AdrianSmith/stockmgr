class CreatePhysicalForms < ActiveRecord::Migration
  def self.up
    create_table :physical_forms do |t|
      t.string :name, :null => false, :unique => true
      t.text :description
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :physical_forms
  end
end
