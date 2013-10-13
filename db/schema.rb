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

ActiveRecord::Schema.define(version: 20131012041935) do

  create_table "guest_categories", force: true do |t|
    t.string   "name"
    t.integer  "default_likelihood"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", force: true do |t|
    t.string   "first"
    t.string   "last"
    t.integer  "num_invited"
    t.integer  "likelihood"
    t.integer  "guest_category_id"
    t.integer  "rsvp_adults"
    t.integer  "rsvp_children"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "relationship"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guest_name"
    t.string   "ext_id"
  end

  add_index "guests", ["guest_category_id"], name: "index_guests_on_guest_category_id", using: :btree

end
