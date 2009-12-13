class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name, :null => :no
      t.string :last_name, :null => :no
      t.boolean :is_virtual, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
