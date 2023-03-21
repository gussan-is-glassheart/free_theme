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

ActiveRecord::Schema[7.0].define(version: 2023_03_20_062039) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "photo_achievements", force: :cascade do |t|
    t.bigint "theme_board_id", null: false
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_board_id"], name: "index_photo_achievements_on_theme_board_id", unique: true
  end

  create_table "photo_theme_items", force: :cascade do |t|
    t.bigint "photo_theme_id", null: false
    t.bigint "theme_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photo_theme_id"], name: "index_photo_theme_items_on_photo_theme_id"
    t.index ["theme_item_id"], name: "index_photo_theme_items_on_theme_item_id"
  end

  create_table "photo_themes", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "target", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_photo_themes_on_category_id"
    t.index ["target"], name: "index_photo_themes_on_target", unique: true
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

  create_table "theme_items", force: :cascade do |t|
    t.string "subject", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject"], name: "index_theme_items_on_subject", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.boolean "temporary", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "photo_achievements", "theme_boards"
  add_foreign_key "photo_theme_items", "photo_themes"
  add_foreign_key "photo_theme_items", "theme_items"
  add_foreign_key "photo_themes", "categories"
  add_foreign_key "theme_boards", "users"
end
