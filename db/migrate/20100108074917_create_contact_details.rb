class CreateContactDetails < ActiveRecord::Migration
  def self.up
    create_table :contact_details do |t|
      t.string :address_line_1
      t.string :address_line_2
      t.string :suburb_town
      t.string :city
      t.string :state
      t.string :postcode
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :contact_details
  end
end
