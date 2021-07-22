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

ActiveRecord::Schema.define(version: 2021_07_21_235929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "body"
    t.bigint "roast_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roast_id"], name: "index_comments_on_roast_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roasters", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "img_url"
    t.string "password_digest"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.integer "latitude"
    t.integer "longitude"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.string "notes"
    t.string "origin"
    t.string "description"
    t.bigint "roaster_id", null: false
    t.string "beanType"
    t.string "productionDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "published"
    t.index ["roaster_id"], name: "index_roasts_on_roaster_id"
  end

  add_foreign_key "comments", "roasts"
  add_foreign_key "roasts", "roasters"
end
