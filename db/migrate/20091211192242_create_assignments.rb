class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :person_id, :null => :no
      t.integer :task_id, :null => :no
      t.decimal :fte_load, :null => :no

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
