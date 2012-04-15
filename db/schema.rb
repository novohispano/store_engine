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

ActiveRecord::Schema.define(:version => 20120415170101) do

  create_table "billing_addresses", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "quantity"
    t.integer  "price_cents"
    t.integer  "shopping_cart_id"
    t.integer  "product_id"
    t.integer  "order_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "status_id"
    t.integer  "user_id"
    t.integer  "shipping_address_id"
    t.integer  "billing_address_id"
    t.datetime "status_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "photo"
    t.integer  "price_cents"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "retired",     :default => false
  end

  create_table "shipping_addresses", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shoppers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shopping_carts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                            :null => false
    t.string   "display_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "admin",            :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
