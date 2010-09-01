class CreateUnitsOfMeasures < ActiveRecord::Migration
  def self.up
    create_table :units_of_measures do |t|
      t.string :name
      t.text :description
      t.string :short_name

      t.timestamps
    end
  end

  def self.down
    drop_table :units_of_measures
  end
end
