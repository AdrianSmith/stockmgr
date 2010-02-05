# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100109231647) do

  create_table "certifiers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "logo_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.decimal  "amount",             :precision => 8, :scale => 2, :default => 0.0
    t.integer  "payment_type_id"
    t.integer  "user_id"
    t.integer  "created_by_user_id"
    t.datetime "received_at"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["payment_type_id"], :name => "index_payments_on_payment_type_id"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "physical_forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "image_url"
    t.text     "description"
    t.text     "supplier_reference"
    t.integer  "product_type_id"
    t.integer  "supplier_id"
    t.integer  "certifier_id"
    t.integer  "storage_type_id"
    t.integer  "units_of_measure_id"
    t.integer  "storage_location_id"
    t.integer  "physical_form_id"
    t.integer  "stock_quantity",      :limit => 10, :precision => 10, :scale => 0
    t.decimal  "stock_cost",                        :precision => 8,  :scale => 2, :default => 0.0
    t.decimal  "sale_price",                        :precision => 8,  :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["certifier_id"], :name => "index_products_on_certifier_id"
  add_index "products", ["physical_form_id"], :name => "index_products_on_physical_form_id"
  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"
  add_index "products", ["storage_location_id"], :name => "index_products_on_storage_location_id"
  add_index "products", ["storage_type_id"], :name => "index_products_on_storage_type_id"
  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"
  add_index "products", ["units_of_measure_id"], :name => "index_products_on_units_of_measure_id"

  create_table "purchase_order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "purchase_order_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_order_items", ["purchase_order_id"], :name => "index_purchase_order_items_on_purchase_order_id"

  create_table "purchase_orders", :force => true do |t|
    t.integer  "supplier_id"
    t.text     "comment"
    t.boolean  "is_created"
    t.boolean  "is_paid"
    t.boolean  "is_received"
    t.integer  "created_by_user_id"
    t.decimal  "amount",             :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_orders", ["supplier_id"], :name => "index_purchase_orders_on_supplier_id"

  create_table "sales_order_items", :force => true do |t|
    t.integer  "sales_order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "custom_price",     :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "use_custom_price",                               :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales_order_items", ["sales_order_id"], :name => "index_sales_order_items_on_sales_order_id"

  create_table "sales_orders", :force => true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "created_by_user_id"
    t.boolean  "is_ordered"
    t.boolean  "is_invoiced"
    t.boolean  "is_paid"
    t.decimal  "invoice_amount",     :precision => 8, :scale => 2, :default => 0.0
    t.datetime "invoiced_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales_orders", ["user_id"], :name => "index_sales_orders_on_user_id"

  create_table "storage_locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storage_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "email"
    t.string   "account_name"
    t.string   "account_number"
    t.text     "comment"
    t.text     "delivery_rules"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "suburb_town"
    t.string   "city"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "phone_mobile"
    t.string   "phone_home"
    t.string   "phone_work"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units_of_measures", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",                                                          :default => false
    t.boolean  "is_staff",                                                          :default => false
    t.boolean  "is_customer",                                                       :default => true
    t.decimal  "account_balance_cached",              :precision => 8, :scale => 2, :default => 0.0
    t.integer  "percentage_discount",    :limit => 3,                               :default => 0
    t.integer  "lock_version",                                                      :default => 0
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "suburb_town"
    t.string   "city"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
    t.string   "phone_mobile"
    t.string   "phone_home"
    t.string   "phone_work"
  end

end
