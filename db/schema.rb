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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151017083243) do

  create_table "items", force: :cascade do |t|
    t.string   "itemId",            limit: 255
    t.text     "itemSupplier",      limit: 65535
    t.integer  "itemStockQuantity", limit: 4
    t.integer  "itemBasePrice",     limit: 4
    t.text     "itemTags",          limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "orderId",       limit: 255
    t.time     "orderDateTime"
    t.string   "orderUserId",   limit: 255
    t.string   "orderItemId",   limit: 255
    t.integer  "orderQuantity", limit: 4
    t.text     "orderState",    limit: 65535
    t.text     "orderTags",     limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "userId",           limit: 255
    t.text     "userCompany",      limit: 65535
    t.integer  "userDiscountRate", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end