class CreateContactDetailTypes < ActiveRecord::Migration
  def self.up
    create_table :contact_detail_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_detail_types
  end
end
