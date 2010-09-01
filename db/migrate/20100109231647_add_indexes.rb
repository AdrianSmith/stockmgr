class AddIndexes < ActiveRecord::Migration
  def self.up

    # These indexes were found by searching for AR::Base finds on your application
    # It is strongly recommanded that you will consult a professional DBA about your infrastucture and implemntation before
    # changing your database in that matter.
    # There is a possibility that some of the indexes offered below is not required and can be removed and not added, if you require
    # further assistance with your rails application, database infrastructure or any other problem, visit:
    #
    # http://www.railsmentors.org
    # http://www.railstutor.org
    # http://guides.rubyonrails.org


    add_index :payments, :payment_type_id
    add_index :payments, :user_id
    add_index :products, :units_of_measure_id
    add_index :products, :supplier_id
    add_index :products, :product_type_id
    add_index :products, :certifier_id
    add_index :products, :storage_type_id
    add_index :products, :storage_location_id
    add_index :products, :physical_form_id
    add_index :sales_orders, :user_id
    add_index :sales_order_items, :sales_order_id
    add_index :purchase_orders, :supplier_id
    add_index :purchase_order_items, :purchase_order_id
  end

  def self.down
    remove_index :payments, :payment_type_id
    remove_index :payments, :user_id
    remove_index :products, :units_of_measure_id
    remove_index :products, :supplier_id
    remove_index :products, :product_type_id
    remove_index :products, :certifier_id
    remove_index :products, :storage_type_id
    remove_index :products, :storage_location_id
    remove_index :products, :physical_form_id
    remove_index :sales_orders, :user_id
    remove_index :sales_order_items, :sales_order_id
    remove_index :purchase_orders, :supplier_id
    remove_index :purchase_order_items, :purchase_order_id
  end
end