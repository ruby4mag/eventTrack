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

ActiveRecord::Schema.define(version: 20151219152415) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "hostname",       limit: 255,   default: ""
    t.string   "servicename",    limit: 255,   default: ""
    t.integer  "severity",       limit: 4
    t.text     "message",        limit: 65535
    t.integer  "ticket_status",  limit: 4
    t.string   "ticket_number",  limit: 255,   default: ""
    t.string   "event_source",   limit: 255,   default: ""
    t.datetime "first_time"
    t.datetime "last_occurance"
    t.integer  "count",          limit: 4
    t.integer  "event_status",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "eventid",        limit: 255,   default: ""
  end

  create_table "high_scores", force: :cascade do |t|
    t.string   "game",       limit: 255
    t.integer  "score",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "categoty",   limit: 255
    t.string   "date",       limit: 255
    t.string   "Price",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
