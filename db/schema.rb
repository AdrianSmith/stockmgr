# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110318090040) do

  create_table "certifiers", :force => true do |t|
    t.string   "name",                             :null => false
    t.text     "description"
    t.string   "website"
    t.string   "logo_image_url"
    t.boolean  "active",         :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name",                                                             :null => false
    t.string   "last_name",                                                              :null => false
    t.string   "email"
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
    t.text     "comment"
    t.decimal  "account_balance_cached", :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "active",                                               :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.decimal  "amount",          :precision => 8, :scale => 2, :default => 0.0
    t.integer  "payment_type_id",                                                :null => false
    t.integer  "customer_id",                                                    :null => false
    t.datetime "received_at"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["customer_id"], :name => "index_payments_on_customer_id"

  create_table "physical_forms", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_prices", :force => true do |t|
    t.integer  "product_id",                                                :null => false
    t.decimal  "amount",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                                :null => false
    t.text     "description"
    t.string   "supplier_reference"
    t.integer  "product_type_id",                                                     :null => false
    t.integer  "supplier_id",                                                         :null => false
    t.integer  "certifier_id"
    t.string   "storage_type_id"
    t.integer  "units_of_measure_id",                                                 :null => false
    t.decimal  "minimum_quantity",    :precision => 8, :scale => 2, :default => 1.0
    t.integer  "storage_location_id"
    t.integer  "physical_form_id"
    t.decimal  "purchase_price",      :precision => 8, :scale => 2, :default => 0.0,  :null => false
    t.boolean  "include_gst",                                       :default => true, :null => false
    t.boolean  "active",                                            :default => true, :null => false
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
    t.integer  "product_id",                                                       :null => false
    t.integer  "purchase_order_id",                                                :null => false
    t.decimal  "quantity",          :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", :force => true do |t|
    t.integer  "supplier_id",                                                  :null => false
    t.text     "comment"
    t.boolean  "paid",                                      :default => false, :null => false
    t.boolean  "received",                                  :default => false, :null => false
    t.decimal  "amount",      :precision => 8, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchase_orders", ["supplier_id"], :name => "index_purchase_orders_on_supplier_id"

  create_table "sales_order_items", :force => true do |t|
    t.integer  "sales_order_id",                                                 :null => false
    t.integer  "product_id",                                                     :null => false
    t.decimal  "quantity",       :precision => 12, :scale => 3, :default => 0.0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_orders", :force => true do |t|
    t.integer  "customer_id",                        :null => false
    t.boolean  "ordered",         :default => false, :null => false
    t.boolean  "invoiced",        :default => false, :null => false
    t.boolean  "paid",            :default => false, :null => false
    t.datetime "invoiced_at"
    t.text     "public_comment"
    t.text     "private_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales_orders", ["customer_id"], :name => "index_sales_orders_on_customer_id"

  create_table "storage_locations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storage_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name",                             :null => false
    t.text     "description"
    t.string   "website"
    t.string   "email"
    t.string   "account_name"
    t.string   "account_number"
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
    t.text     "comment"
    t.boolean  "active",         :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units_of_measures", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "short_name"
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
