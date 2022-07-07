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

ActiveRecord::Schema[7.0].define(version: 2022_07_07_041024) do
  create_table "options", charset: "utf8mb4", force: :cascade do |t|
    t.string "handle"
    t.string "option1_name"
    t.string "option1_value"
    t.string "option2_name"
    t.string "option2_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handle"], name: "index_options_on_handle"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "handle"
    t.text "body"
    t.integer "variant_price"
    t.string "image_src"
    t.string "image_alt"
    t.string "option1_name"
    t.string "option2_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["handle"], name: "index_products_on_handle"
  end

end
