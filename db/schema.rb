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

ActiveRecord::Schema.define(version: 2019_05_28_182658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "car_brand"
    t.string "state_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "number"
    t.datetime "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "car_id"
    t.index ["car_id"], name: "index_orders_on_car_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "telemetries", force: :cascade do |t|
    t.float "speed"
    t.float "oil_level"
    t.float "mileage"
    t.bigint "car_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "ignition", default: "false"
    t.binary "engine_started", default: "false"
    t.binary "lights", default: "false"
    t.float "latitude"
    t.float "longtitude"
    t.float "altitude"
    t.bigint "device_id"
    t.index ["car_id"], name: "index_telemetries_on_car_id"
    t.index ["order_id"], name: "index_telemetries_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "role"
    t.string "nickname", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "users"
  add_foreign_key "orders", "cars"
  add_foreign_key "orders", "users"
  add_foreign_key "telemetries", "cars"
  add_foreign_key "telemetries", "orders"
end
