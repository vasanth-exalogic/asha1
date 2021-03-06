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

ActiveRecord::Schema.define(version: 2019_11_25_063407) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "datebirth"
    t.date "datejoining"
    t.decimal "age"
    t.decimal "sal"
    t.decimal "salpm"
    t.decimal "contact"
    t.string "bloodtype"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.decimal "pincode"
    t.string "gender"
    t.string "ename"
    t.decimal "econtact"
    t.string "pskill"
    t.string "sskill"
    t.string "sskill2"
    t.decimal "notice"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "relation"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
