# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_03_182255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offices", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "area"
    t.integer "occupancy", default: 0
    t.string "images", array: true
    t.decimal "basic_price", default: "0.0"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "peripherals", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peripherals_reservations", id: false, force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "peripheral_id", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_reservations_on_office_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reservations_services", id: false, force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "service_id", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "offices", "users"
  add_foreign_key "reservations", "offices"
  add_foreign_key "reservations", "users"
end
