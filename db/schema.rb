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

ActiveRecord::Schema[7.1].define(version: 2024_06_19_105222) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.string "edison_case_code"
    t.string "brand_name"
    t.string "client_name"
    t.string "law_firm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "internal_name"
  end

  create_table "defendants", force: :cascade do |t|
    t.string "name"
    t.string "marketplace_id"
    t.string "location"
    t.string "feedback"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "case_id"
    t.index ["case_id"], name: "index_defendants_on_case_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.integer "marketplace_id"
    t.decimal "price"
    t.string "product_type"
    t.boolean "tm_in_image", default: false
    t.boolean "tm_in_title", default: false
    t.boolean "tm_in_description", default: false
    t.boolean "design_patent", default: false
    t.boolean "utility_patent", default: false
    t.boolean "copyright_images", default: false
    t.boolean "copyright_texts", default: false
    t.boolean "fba", default: false
    t.integer "items_sold"
    t.string "notes"
    t.boolean "trademark_used", default: false
    t.boolean "proof_of_sale", default: false
    t.boolean "should_sue", default: false
    t.string "copyright_usage_filenames"
    t.string "tm_registration_number"
    t.integer "defendant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "defendants", "cases"
  add_foreign_key "products", "defendants"
end
