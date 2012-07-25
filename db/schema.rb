# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120724104032) do

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "suburb"
    t.string   "city"
    t.string   "postcode"
    t.string   "phone_mobile"
    t.string   "phone_home"
    t.string   "phone_work"
    t.decimal  "account_balance_cached", :precision => 8, :scale => 2, :default => 0.0
    t.boolean  "active",                                               :default => true, :null => false
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
  end

  create_table "payment_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "payments", :force => true do |t|
    t.decimal  "amount",          :precision => 8, :scale => 2, :default => 0.0
    t.integer  "payment_type_id",                                                :null => false
    t.integer  "customer_id",                                                    :null => false
    t.text     "comment"
    t.datetime "received_at"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  add_index "payments", ["customer_id"], :name => "index_payments_on_customer_id"
  add_index "payments", ["payment_type_id"], :name => "index_payments_on_payment_type_id"

  create_table "product_prices", :force => true do |t|
    t.integer  "product_id",                                                :null => false
    t.decimal  "amount",     :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "product_prices", ["product_id"], :name => "index_product_prices_on_product_id"

  create_table "product_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.boolean  "active",      :default => true, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                                :null => false
    t.integer  "product_type_id",                                                     :null => false
    t.text     "description"
    t.integer  "supplier_id",                                                         :null => false
    t.string   "supplier_reference"
    t.string   "brand"
    t.decimal  "purchase_price",     :precision => 8, :scale => 2, :default => 0.0,   :null => false
    t.boolean  "gst",                                              :default => false, :null => false
    t.boolean  "active",                                           :default => true,  :null => false
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
  end

  add_index "products", ["product_type_id"], :name => "index_products_on_product_type_id"
  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"

  create_table "sales_order_items", :force => true do |t|
    t.integer  "sales_order_id",                                                 :null => false
    t.integer  "product_id",                                                     :null => false
    t.decimal  "quantity",       :precision => 12, :scale => 3, :default => 0.0, :null => false
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  add_index "sales_order_items", ["product_id"], :name => "index_sales_order_items_on_product_id"
  add_index "sales_order_items", ["sales_order_id"], :name => "index_sales_order_items_on_sales_order_id"

  create_table "sales_orders", :force => true do |t|
    t.integer  "customer_id",                        :null => false
    t.boolean  "invoiced",        :default => false
    t.datetime "invoiced_at"
    t.boolean  "paid",            :default => false
    t.datetime "paid_at"
    t.text     "private_comment"
    t.text     "public_comment"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "sales_orders", ["customer_id"], :name => "index_sales_orders_on_customer_id"

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
    t.string   "suburb"
    t.string   "city"
    t.string   "postcode"
    t.string   "phone_mobile"
    t.string   "phone_home"
    t.string   "phone_work"
    t.text     "comment"
    t.boolean  "active",         :default => true, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
