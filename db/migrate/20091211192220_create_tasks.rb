class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name, :null => :no
      t.text :description
      t.integer :skill_id, :null => :no
      t.date :start, :null => :no
      t.date :finish, :null => :no
      t.decimal :fte_load, :null => :no

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
