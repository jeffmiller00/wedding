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

ActiveRecord::Schema.define(version: 20140602020838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_categories", force: true do |t|
    t.string   "name"
    t.integer  "default_likelihood"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", force: true do |t|
    t.string   "first"
    t.string   "last"
    t.integer  "invited_adults"
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
    t.string   "guest_first"
    t.string   "ext_id"
    t.integer  "invited_children"
    t.string   "guest_last"
  end

  add_index "guests", ["guest_category_id"], name: "index_guests_on_guest_category_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsvps", force: true do |t|
    t.string   "invited_guest_name"
    t.boolean  "plus_one"
    t.string   "plus_one_name"
    t.string   "meal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
