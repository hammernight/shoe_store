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

ActiveRecord::Schema.define(version: 20120628014546) do

  create_table "achievements", force: :cascade do |t|
    t.text     "type",       limit: 65535, null: false
    t.integer  "request_id", limit: 4,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "issues", force: :cascade do |t|
    t.string "title",       limit: 255
    t.string "description", limit: 255
    t.string "severity",    limit: 255
  end

  create_table "requests", force: :cascade do |t|
    t.text     "data",       limit: 4294967295
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "ip_address", limit: 65535
  end

  create_table "shoes", force: :cascade do |t|
    t.string "name",          limit: 255
    t.string "brand_id",      limit: 255
    t.string "release_month", limit: 255
    t.text   "description",   limit: 65535
    t.string "image_path",    limit: 255
    t.string "price",         limit: 255
  end

end
