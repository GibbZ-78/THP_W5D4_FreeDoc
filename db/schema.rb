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

ActiveRecord::Schema.define(version: 2022_02_10_110703) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.integer "doctor_id"
    t.integer "patient_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_appointments_on_city_id"
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diploma_specialties", force: :cascade do |t|
    t.integer "diploma_id"
    t.integer "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diploma_id"], name: "index_diploma_specialties_on_diploma_id"
    t.index ["specialty_id"], name: "index_diploma_specialties_on_specialty_id"
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctor_diplomas", force: :cascade do |t|
    t.date "date_obtained"
    t.date "expiration_date"
    t.integer "doctor_id"
    t.integer "diploma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diploma_id"], name: "index_doctor_diplomas_on_diploma_id"
    t.index ["doctor_id"], name: "index_doctor_diplomas_on_doctor_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_doctors_on_city_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_patients_on_city_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
