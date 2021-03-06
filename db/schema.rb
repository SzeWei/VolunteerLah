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

ActiveRecord::Schema.define(version: 20161216130039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_comments_on_event_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "event_details", force: :cascade do |t|
    t.string   "venue_title"
    t.string   "street_address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "state"
    t.string   "contact_num"
    t.integer  "event_id"
    t.string   "day_time"
    t.float    "longitude",      null: false
    t.float    "latitude",       null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["event_id"], name: "index_event_details_on_event_id", using: :btree
  end

  create_table "event_volunteers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.index ["event_id"], name: "index_event_volunteers_on_event_id", using: :btree
    t.index ["user_id"], name: "index_event_volunteers_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                    null: false
    t.string   "description"
    t.date     "start_date",               null: false
    t.date     "end_date",                 null: false
    t.integer  "category",                 null: false
    t.integer  "user_id"
    t.integer  "target_space"
    t.json     "event_photos"
    t.integer  "status",       default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "organisation_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "field_or_industry"
    t.string   "website"
    t.text     "org_description"
    t.integer  "org_size"
    t.string   "language"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "contact_person"
    t.text     "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "state"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.json     "org_photos"
    t.index ["user_id"], name: "index_organisation_profiles_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.text     "skills"
    t.text     "description"
    t.string   "gender"
    t.string   "phone"
    t.text     "street_address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "state"
    t.string   "country",        default: "Malaysia"
    t.date     "birthdate"
    t.string   "contact_email"
    t.string   "language"
    t.text     "work"
    t.text     "education"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "role",                   default: 2
    t.string   "provider"
    t.string   "uid"
    t.string   "name",                   default: "New Member"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "event_details", "events"
  add_foreign_key "event_volunteers", "events"
  add_foreign_key "event_volunteers", "users"
  add_foreign_key "events", "users"
  add_foreign_key "organisation_profiles", "users"
  add_foreign_key "profiles", "users"
end
