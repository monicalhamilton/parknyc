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

ActiveRecord::Schema.define(version: 20160315233659) do

  create_table "signs", force: :cascade do |t|
    t.decimal  "x_coordinate",       null: false
    t.decimal  "y_coordinate",       null: false
    t.integer  "street_location_id"
    t.integer  "object_id",          null: false
    t.integer  "sequence_number",    null: false
    t.string   "sign_code",          null: false
    t.integer  "curb_distance_feet", null: false
    t.string   "sign_faces"
    t.string   "sign_arrows"
    t.string   "sign_description",   null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "signs", ["street_location_id"], name: "index_signs_on_street_location_id"

  create_table "street_locations", force: :cascade do |t|
    t.string   "borough_key",    limit: 1, null: false
    t.string   "order_number",             null: false
    t.string   "main_street",              null: false
    t.string   "from_street",              null: false
    t.string   "to_street",                null: false
    t.string   "side_of_street", limit: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
