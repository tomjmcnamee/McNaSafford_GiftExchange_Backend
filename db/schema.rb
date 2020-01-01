# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_30_050317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email_address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "event_gift_getters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_gift_getters_on_event_id"
    t.index ["user_id"], name: "index_event_gift_getters_on_user_id"
  end

  create_table "event_gift_givers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_gift_givers_on_event_id"
    t.index ["user_id"], name: "index_event_gift_givers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.date "event_date"
    t.bigint "event_managing_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_managing_user_id"], name: "index_events_on_event_managing_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.bigint "account_id"
    t.bigint "managing_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["managing_account_id"], name: "index_users_on_managing_account_id"
  end

  create_table "wish_lists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "giving_user_id"
    t.string "gift_name"
    t.string "amazon_url"
    t.string "gift_image"
    t.string "status", default: "added"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["giving_user_id"], name: "index_wish_lists_on_giving_user_id"
    t.index ["user_id"], name: "index_wish_lists_on_user_id"
  end

  add_foreign_key "event_gift_getters", "events"
  add_foreign_key "event_gift_getters", "users"
  add_foreign_key "event_gift_givers", "events"
  add_foreign_key "event_gift_givers", "users"
  add_foreign_key "events", "users", column: "event_managing_user_id"
  add_foreign_key "users", "accounts"
  add_foreign_key "users", "accounts", column: "managing_account_id"
  add_foreign_key "wish_lists", "users"
  add_foreign_key "wish_lists", "users", column: "giving_user_id"
end
