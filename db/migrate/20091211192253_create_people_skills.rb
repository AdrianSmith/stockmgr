class CreatePeopleSkills < ActiveRecord::Migration
  def self.up
    create_table :people_skills do |t|
      t.integer :person_id, :null => :no
      t.integer :skill_id, :null => :no

      t.timestamps
    end
  end

  def self.down
    drop_table :people_skills
  end
end
