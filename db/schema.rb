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

ActiveRecord::Schema.define(version: 2019_10_07_095246) do

  create_table "map_files", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "map_id", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id", null: false
    t.string "size"
    t.integer "mode"
    t.integer "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.text "version"
    t.json "links"
    t.index ["name"], name: "index_maps_on_name", unique: true
    t.index ["user_id"], name: "index_maps_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "map_id", null: false
    t.integer "user_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "positive"
    t.string "comment"
    t.index ["map_id"], name: "index_ratings_on_map_id"
    t.index ["user_id", "map_id"], name: "index_ratings_on_user_id_and_map_id", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "screenshots", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "map_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "maps", "users"
  add_foreign_key "ratings", "maps"
  add_foreign_key "ratings", "users"
end
