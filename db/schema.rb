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

ActiveRecord::Schema.define(version: 2018_10_04_223307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "healthcare_providers", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.string "employee_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.datetime "date_of_birth"
    t.string "address_1"
    t.string "address_2"
    t.string "zip_code"
    t.string "state"
    t.string "city"
    t.string "medication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
