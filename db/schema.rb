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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_025550) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_themes", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "target", null: false
    t.string "subject", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_photo_themes_on_category_id"
  end

  create_table "theme_boards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "complete", default: false, null: false
    t.integer "themeable_id"
    t.string "themeable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["themeable_type", "themeable_id"], name: "index_theme_boards_on_themeable_type_and_themeable_id"
    t.index ["user_id"], name: "index_theme_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "photo_themes", "categories"
  add_foreign_key "theme_boards", "users"
end
