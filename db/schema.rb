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

ActiveRecord::Schema.define(version: 2020_07_20_182853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", id: :serial, force: :cascade do |t|
    t.string "name"
    t.boolean "public?", default: true
    t.integer "group_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "group_id"], name: "index_channels_on_name_and_group_id", unique: true
  end

  create_table "group_users", id: :serial, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "display_name"
    t.boolean "public?", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "join_requests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pending"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.integer "channel_id", null: false
    t.integer "user_id", null: false
    t.text "contents", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
