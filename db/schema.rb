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

ActiveRecord::Schema.define(version: 20170602081312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer  "railway_station_id"
    t.integer  "route_id"
    t.integer  "station_position"
    t.integer  "position"
    t.datetime "arrive",             default: '2016-12-31 21:00:00'
    t.datetime "departure",          default: '2016-12-31 21:00:00'
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id", using: :btree
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id", using: :btree
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "source"
    t.string   "destination"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "train_id"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.integer  "user_id"
    t.string   "passenger_fio",  default: "FIO"
    t.string   "passport_data",  default: "PASSPORT"
    t.index ["destination_id"], name: "index_tickets_on_destination_id", using: :btree
    t.index ["source_id"], name: "index_tickets_on_source_id", using: :btree
    t.index ["train_id"], name: "index_tickets_on_train_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "head_sort",          default: true
    t.index ["current_station_id"], name: "index_trains_on_current_station_id", using: :btree
    t.index ["route_id"], name: "index_trains_on_route_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.string   "user_firstname"
    t.string   "user_family"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "number"
    t.integer  "upper_places",      default: 10
    t.integer  "lower_places",      default: 10
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "train_id"
    t.integer  "side_upper_places", default: 10
    t.integer  "side_lower_places", default: 10
    t.integer  "seats",             default: 10
    t.string   "type"
    t.index ["id", "type"], name: "index_wagons_on_id_and_type", using: :btree
    t.index ["train_id"], name: "index_wagons_on_train_id", using: :btree
  end

end
