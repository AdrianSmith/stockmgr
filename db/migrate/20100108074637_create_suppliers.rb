class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :email
      t.text :comment
      t.text :delivery_rules

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
