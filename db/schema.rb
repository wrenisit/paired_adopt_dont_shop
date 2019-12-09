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

ActiveRecord::Schema.define(version: 20191209224231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adopts", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "phone"
    t.string "description"
    t.string "zip"
  end

  create_table "pet_adopts", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "adopt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adopt_id"], name: "index_pet_adopts_on_adopt_id"
    t.index ["pet_id"], name: "index_pet_adopts_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.integer "approximate_age"
    t.string "sex"
    t.bigint "shelter_id"
    t.string "image"
    t.string "description"
    t.boolean "adoptable", default: true
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.string "content"
    t.string "opt_picture"
    t.bigint "shelter_id"
    t.index ["shelter_id"], name: "index_reviews_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
  end

  add_foreign_key "pet_adopts", "adopts"
  add_foreign_key "pet_adopts", "pets"
  add_foreign_key "pets", "shelters"
  add_foreign_key "reviews", "shelters"
end
