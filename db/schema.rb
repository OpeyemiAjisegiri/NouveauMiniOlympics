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

ActiveRecord::Schema.define(version: 20160506205940) do

  create_table "medals", force: true do |t|
    t.integer  "sport_id"
    t.integer  "gold_id"
    t.integer  "silver_id"
    t.integer  "bronze_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "medals", ["bronze_id"], name: "index_medals_on_bronze_id", using: :btree
  add_index "medals", ["gold_id"], name: "index_medals_on_gold_id", using: :btree
  add_index "medals", ["silver_id"], name: "index_medals_on_silver_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "sex"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: true do |t|
    t.string   "sportname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "teamname"
    t.string   "teamcolor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teamsports", force: true do |t|
    t.integer  "team_id"
    t.integer  "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teamsports", ["sport_id"], name: "index_teamsports_on_sport_id", using: :btree
  add_index "teamsports", ["team_id"], name: "index_teamsports_on_team_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.integer  "captain_id"
    t.integer  "team_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["captain_id"], name: "index_users_on_captain_id", using: :btree

end
