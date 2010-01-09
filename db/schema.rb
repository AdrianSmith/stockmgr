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

ActiveRecord::Schema.define(:version => 20100108222247) do

  create_table "contact_detail_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_details", :force => true do |t|
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "suburb_town"
    t.string   "city"
    t.string   "state"
    t.string   "postcode"
    t.string   "country"
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
    t.integer  "amount",             :limit => 10, :precision => 10, :scale => 0
    t.integer  "payment_type_id"
    t.integer  "user_id"
    t.integer  "created_by_user_id"
    t.datetime "received_at"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physical_forms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_prices", :force => true do |t|
    t.integer  "product_id"
    t.integer  "amount",     :limit => 10, :precision => 10, :scale => 0
    t.text     "comment"
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
    t.text     "description"
    t.integer  "product_type_id"
    t.integer  "supplier_id"
    t.integer  "storage_type_id"
    t.integer  "units_of_measure_id"
    t.integer  "storage_location_id"
    t.integer  "physical_form_id"
    t.integer  "stock_amount",        :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity",   :limit => 10, :precision => 10, :scale => 0
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_states", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", :force => true do |t|
    t.integer  "supplier_id"
    t.text     "comment"
    t.integer  "created_by_user_id"
    t.integer  "purchase_order_state_id"
    t.integer  "price",                   :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity",            :limit => 10, :precision => 10, :scale => 0
    t.integer  "percentage_discount"
    t.integer  "price",               :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_order_states", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_orders", :force => true do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "created_by_user_id"
    t.integer  "sales_order_state_id"
    t.boolean  "is_invoiced"
    t.integer  "invoice_amount",       :limit => 10, :precision => 10, :scale => 0
    t.datetime "invoiced_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.text     "comment"
    t.text     "delivery_rules"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers_contact_details", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contact_detail_id"
    t.integer  "contact_detail_type_id"
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
    t.string   "address_line_1",                                                    :default => "",    :null => false
    t.string   "address_line_2"
    t.string   "suburb",                                                            :default => "",    :null => false
    t.string   "postcode",                                                          :default => "",    :null => false
    t.string   "phone_mobile"
    t.string   "phone_home"
    t.string   "phone_work"
    t.boolean  "is_admin",                                                          :default => false
    t.boolean  "is_staff",                                                          :default => false
    t.boolean  "is_supplier",                                                       :default => false
    t.boolean  "is_customer",                                                       :default => true
    t.decimal  "account_balance_cached",              :precision => 8, :scale => 2, :default => 0.0
    t.integer  "percentage_discount",    :limit => 3,                               :default => 0
    t.integer  "lock_version",                                                      :default => 0
  end

  create_table "users_contact_details", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contact_detail_id"
    t.integer  "contact_detail_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
