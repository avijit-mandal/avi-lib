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

ActiveRecord::Schema.define(version: 20180729173635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_contents", id: :serial, force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.string "chapter"
    t.text "chapter_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", id: :serial, force: :cascade do |t|
    t.string "title", limit: 32, null: false
    t.float "price"
    t.integer "subject_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "author"
  end

  create_table "images", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_id"], name: "index_images_on_imageable_id"
  end

  create_table "madicines", force: :cascade do |t|
    t.string "manufacturer"
    t.string "name"
    t.string "m_type"
    t.string "unit"
    t.string "price"
  end

  create_table "subjects", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "tests", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", id: :serial, force: :cascade do |t|
    t.integer "phone_no"
    t.text "address"
    t.string "sex"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "first_name"
    t.string "last_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "user_profiles", "users"
end
