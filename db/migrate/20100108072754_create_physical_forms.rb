class CreatePhysicalForms < ActiveRecord::Migration
  def self.up
    create_table :physical_forms do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :physical_forms
  end
end
