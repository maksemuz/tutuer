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

ActiveRecord::Schema.define(version: 20170509095136) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "station_position"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "source"
    t.string   "destination"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "train_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.index ["destination_id"], name: "index_tickets_on_destination_id"
    t.index ["source_id"], name: "index_tickets_on_source_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "sort_flag",          default: true
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "upper_places",      default: 10
    t.integer  "lower_places",      default: 10
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "train_id"
    t.integer  "side_upper_places", default: 10
    t.integer  "side_lower_places", default: 10
    t.integer  "seats",             default: 10
    t.string   "type",              default: "Coupe"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
