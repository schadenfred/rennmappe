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

ActiveRecord::Schema.define(version: 20170325015256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "checks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "parent_id"
    t.integer  "org_id"
    t.integer  "range_low"
    t.integer  "range_high"
    t.integer  "author_id"
    t.boolean  "internal_check"
    t.string   "measure_units"
    t.boolean  "required"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["author_id"], name: "index_checks_on_author_id", using: :btree
    t.index ["name"], name: "index_checks_on_name", using: :btree
    t.index ["org_id"], name: "index_checks_on_org_id", using: :btree
    t.index ["parent_id"], name: "index_checks_on_parent_id", using: :btree
  end

  create_table "galleriable_galleries", force: :cascade do |t|
    t.string   "name"
    t.string   "galleriable_type"
    t.integer  "galleriable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["galleriable_type", "galleriable_id"], name: "by_galleriable", using: :btree
  end

  create_table "galleriable_photos", force: :cascade do |t|
    t.string   "image_uid"
    t.string   "image_name"
    t.string   "name"
    t.string   "caption"
    t.integer  "photographer_id"
    t.string   "photographable_type"
    t.integer  "photographable_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["photographable_type", "photographable_id"], name: "by_photographable", using: :btree
  end

  create_table "galleriable_slides", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "gallery_id"
    t.hstore   "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_id", "gallery_id"], name: "index_galleriable_slides_on_photo_id_and_gallery_id", using: :btree
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_orgs_on_name", using: :btree
    t.index ["slug"], name: "index_orgs_on_slug", using: :btree
  end

  create_table "orgs_users", force: :cascade do |t|
    t.integer  "org_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "owner_id"
    t.date     "ownership_begin"
    t.date     "ownership_end"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_id", "owner_id"], name: "index_ownerships_on_vehicle_id_and_owner_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "unconfirmed_email"
    t.string   "given_name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "vin"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
