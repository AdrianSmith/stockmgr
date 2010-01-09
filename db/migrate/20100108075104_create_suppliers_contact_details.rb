class CreateSuppliersContactDetails < ActiveRecord::Migration
  def self.up
    create_table :suppliers_contact_details do |t|
      t.integer :supplier_id
      t.integer :contact_detail_id
      t.integer :contact_detail_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers_contact_details
  end
end
