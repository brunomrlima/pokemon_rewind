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

ActiveRecord::Schema.define(version: 2020_09_18_222615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "backups", force: :cascade do |t|
    t.json "raw_json"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "backup_id", null: false
    t.bigint "rarity_id", null: false
    t.string "name"
    t.string "image_url"
    t.string "image_url_hires"
    t.text "description"
    t.integer "national_pokedex_number"
    t.string "evolves_from"
    t.integer "hp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["backup_id"], name: "index_cards_on_backup_id"
    t.index ["rarity_id"], name: "index_cards_on_rarity_id"
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cards", "backups"
  add_foreign_key "cards", "rarities"
end
