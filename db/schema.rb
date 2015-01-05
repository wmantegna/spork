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

ActiveRecord::Schema.define(version: 20150101185228) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.integer  "zip"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "host_id"
    t.date     "date"
  end

  create_table "events_users", force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "preferences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "preferences_restaurants", force: true do |t|
    t.integer "restaurant_id"
    t.integer "preference_id"
  end

  create_table "preferences_users", force: true do |t|
    t.integer "user_id"
    t.integer "preference_id"
  end

  create_table "prefs", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants_restrictions", force: true do |t|
    t.integer "restaurant_id"
    t.integer "restriction_id"
  end

  create_table "restrics", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restrictions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restrictions_users", force: true do |t|
    t.integer "user_id"
    t.integer "restriction_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "yelp_searches", force: true do |t|
    t.string   "term"
    t.integer  "limit"
    t.integer  "offset"
    t.integer  "sort"
    t.string   "category_filter"
    t.integer  "radius_filter"
    t.boolean  "deals_filter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
