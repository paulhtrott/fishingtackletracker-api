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

ActiveRecord::Schema.define(version: 20170923182042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tackle_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tackle_categories_on_name"
  end

  create_table "tackle_types", force: :cascade do |t|
    t.string "name"
    t.integer "tackle_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tackle_types_on_name"
    t.index ["tackle_category_id"], name: "index_tackle_types_on_tackle_category_id"
  end

  create_table "tackles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.decimal "size", precision: 12, scale: 2
    t.integer "quantity"
    t.string "color"
    t.string "model_number"
    t.string "shape"
    t.decimal "length"
    t.decimal "weight"
    t.string "brand"
    t.integer "quantity_wanted"
    t.decimal "price", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "length_unit"
    t.string "weight_unit"
    t.integer "tackle_type_id"
    t.index ["user_id"], name: "index_tackles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "name"
    t.string "address_one"
    t.string "address_two"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
