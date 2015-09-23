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

ActiveRecord::Schema.define(version: 20150922070121) do

  create_table "book_contents", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "chapter"
    t.text     "chapter_content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "books", force: :cascade do |t|
    t.string   "title",       limit: 32, null: false
    t.float    "price"
    t.integer  "subject_id"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.string   "author"
  end

  create_table "images", force: :cascade do |t|
    t.string   "name"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id"

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "phone_no",      limit: 10
    t.text     "address"
    t.string   "sex"
    t.date     "date_of_birth"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
