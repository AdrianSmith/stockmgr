class CreateUsersContactDetails < ActiveRecord::Migration
  def self.up
    create_table :users_contact_details do |t|
      t.integer :user_id
      t.integer :contact_detail_id
      t.integer :contact_detail_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users_contact_details
  end
end
