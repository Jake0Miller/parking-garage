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

ActiveRecord::Schema.define(version: 2019_10_30_055618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "floors", force: :cascade do |t|
    t.integer "level"
    t.integer "width"
    t.integer "length"
    t.bigint "structure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["structure_id"], name: "index_floors_on_structure_id"
  end

  create_table "rows", force: :cascade do |t|
    t.string "letter"
    t.integer "length"
    t.bigint "floor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floor_id"], name: "index_rows_on_floor_id"
  end

  create_table "spots", force: :cascade do |t|
    t.integer "number"
    t.integer "width"
    t.bigint "row_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["row_id"], name: "index_spots_on_row_id"
    t.index ["vehicle_id"], name: "index_spots_on_vehicle_id"
  end

  create_table "structures", force: :cascade do |t|
    t.integer "height", default: 1
    t.integer "width"
    t.integer "length"
    t.float "m_fare", default: 5.0
    t.float "m_revenue", default: 0.0
    t.float "c_fare", default: 5.0
    t.float "c_revenue", default: 0.0
    t.float "b_fare", default: 5.0
    t.float "b_revenue", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "floors", "structures"
  add_foreign_key "rows", "floors"
  add_foreign_key "spots", "rows"
  add_foreign_key "spots", "vehicles"
end
