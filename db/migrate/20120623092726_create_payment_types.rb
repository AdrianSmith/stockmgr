class CreatePaymentTypes < ActiveRecord::Migration
  def change
    create_table :payment_types do |t|
      t.string :name, :null => false
      t.text :description
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
