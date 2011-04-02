class CreateUnitsOfMeasures < ActiveRecord::Migration
  def self.up
    create_table :units_of_measures do |t|
      t.string :name, :null => false, :unique => true
      t.string :short_name
      t.text :description
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :units_of_measures
  end
end
