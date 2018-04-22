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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180423003858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bouquets", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "bouquet"
    t.string "recipient_name"
    t.date "delivery_on"
    t.bigint "order_id"
    t.string "shipping_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_deliveries_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "recipient_name"
    t.bigint "bouquet_id"
    t.date "delivery_on"
    t.string "status", default: "pending"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shipping_method_id"
    t.boolean "three_month_bundle", default: false
    t.index ["bouquet_id"], name: "index_orders_on_bouquet_id"
    t.index ["shipping_method_id"], name: "index_orders_on_shipping_method_id"
  end

  create_table "shipping_methods", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deliveries", "orders"
  add_foreign_key "orders", "shipping_methods"
end
