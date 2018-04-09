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

ActiveRecord::Schema.define(version: 20180409024919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guest_id"
    t.integer "attend_experience_id"
    t.index ["attend_experience_id"], name: "index_attendances_on_attend_experience_id"
    t.index ["guest_id", "attend_experience_id"], name: "index_attendances_on_guest_id_and_attend_experience_id", unique: true
    t.index ["guest_id"], name: "index_attendances_on_guest_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "place"
    t.string "start_day"
    t.string "end_day"
    t.string "price"
    t.integer "capacity"
    t.text "details"
    t.text "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "follow_hosts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "follower_id"
    t.integer "followed_id"
    t.index ["followed_id"], name: "index_follow_hosts_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_follow_hosts_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_follow_hosts_on_follower_id"
  end

  create_table "kudos", force: :cascade do |t|
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "taker_id"
    t.index ["user_id"], name: "index_kudos_on_user_id"
  end

  create_table "kudos_to_guests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guest_id"
    t.integer "host_id"
    t.text "comments"
    t.index ["guest_id", "host_id"], name: "index_kudos_to_guests_on_guest_id_and_host_id", unique: true
    t.index ["guest_id"], name: "index_kudos_to_guests_on_guest_id"
    t.index ["host_id"], name: "index_kudos_to_guests_on_host_id"
  end

  create_table "kudos_to_hosts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "guest_id"
    t.integer "host_id"
    t.text "comments"
    t.index ["guest_id", "host_id"], name: "index_kudos_to_hosts_on_guest_id_and_host_id", unique: true
    t.index ["guest_id"], name: "index_kudos_to_hosts_on_guest_id"
    t.index ["host_id"], name: "index_kudos_to_hosts_on_host_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "bio"
    t.string "title"
    t.boolean "host"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "following_count"
    t.integer "followers_count"
    t.string "token"
    t.string "password_hash"
    t.string "password_salt"
    t.index ["token"], name: "index_users_on_token"
  end

  add_foreign_key "experiences", "users"
  add_foreign_key "kudos", "users"
end
