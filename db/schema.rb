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

ActiveRecord::Schema[7.0].define(version: 2024_12_12_155312) do
  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.text "description", null: false
    t.integer "shipping_cost_id", null: false
    t.integer "shipping_day_id", null: false
    t.integer "shipping_id", null: false
    t.bigint "user_id", null: false
    t.integer "prefecture_id", null: false
    t.integer "condition_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_items_on_email", unique: true
    t.index ["reset_password_token"], name: "index_items_on_reset_password_token", unique: true
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "nick_name", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "read_first", null: false
    t.string "read_last", null: false
    t.string "birth_day", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "users"
end