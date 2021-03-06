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

ActiveRecord::Schema.define(version: 2021_01_06_184342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.integer "background_id", default: 0
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "column_id"
    t.index ["column_id"], name: "index_cards_on_column_id"
  end

  create_table "cards_labels", force: :cascade do |t|
    t.bigint "card_id"
    t.bigint "label_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_cards_labels_on_card_id"
    t.index ["label_id"], name: "index_cards_labels_on_label_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "board_id"
    t.index ["board_id"], name: "index_columns_on_board_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "board_id", null: false
    t.string "color"
    t.index ["board_id"], name: "index_labels_on_board_id"
  end

  create_table "members", id: false, force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "user_id"
    t.index ["board_id"], name: "index_members_on_board_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "done", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "card_id"
    t.index ["card_id"], name: "index_tasks_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
    t.string "username"
    t.string "email"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.string "password_digest"
  end

  add_foreign_key "cards", "columns", on_delete: :cascade
  add_foreign_key "labels", "boards", on_delete: :cascade
  add_foreign_key "tasks", "cards", on_delete: :cascade
end
