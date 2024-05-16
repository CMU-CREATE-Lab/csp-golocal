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

ActiveRecord::Schema[7.0].define(version: 2024_05_16_163151) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.text "business_hours"
    t.text "catering_hours"
    t.string "address"
    t.string "website_link"
    t.text "contact_name_description"
    t.string "contact_email"
    t.string "contact_phone"
    t.string "menu_link"
    t.boolean "offers_delivery"
    t.boolean "offers_catering"
    t.boolean "vegetarian_options"
    t.boolean "vegan_options"
    t.boolean "gluten_free_options"
    t.boolean "handles_tax_exemption"
    t.boolean "handles_small_cater_size"
    t.boolean "handles_medium_cater_size"
    t.boolean "handles_large_cater_size"
    t.boolean "handles_xlarge_cater_size"
    t.text "small_cater_size_lead_time"
    t.text "medium_cater_size_lead_time"
    t.text "large_cater_size_lead_time"
    t.text "xlarge_cater_size_lead_time"
    t.boolean "cater_drop_off"
    t.boolean "cater_setup"
    t.boolean "cater_full_service"
    t.boolean "is_published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "cater_pick_up"
    t.text "headline_description"
    t.text "delivery_information"
  end

  create_table "businesses_keywords", id: false, force: :cascade do |t|
    t.integer "business_id", null: false
    t.integer "keyword_id", null: false
    t.index ["business_id"], name: "index_businesses_keywords_on_business_id"
    t.index ["keyword_id"], name: "index_businesses_keywords_on_keyword_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_businesses", force: :cascade do |t|
    t.string "name"
    t.text "business_hours"
    t.text "catering_hours"
    t.string "address"
    t.string "website_link"
    t.text "contact_name_description"
    t.string "contact_email"
    t.string "contact_phone"
    t.text "keywords"
    t.string "menu_link"
    t.boolean "offers_delivery"
    t.boolean "offers_catering"
    t.boolean "accepts_credit_cards"
    t.boolean "vegetarian_options"
    t.boolean "vegan_options"
    t.boolean "gluten_free_options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
