# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111112103906) do

  create_table "connections", :force => true do |t|
    t.string   "member_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "headline"
    t.string   "location"
    t.string   "country"
    t.string   "industry"
    t.string   "site_standard_profile_request"
    t.string   "picture_url"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", :force => true do |t|
    t.string   "linkedin_education_id"
    t.string   "school_name"
    t.string   "degree"
    t.string   "field_of_study"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "notes"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "headline"
    t.string "industry"
    t.string "summary"
    t.string "specialities"
    t.string "interests"
    t.string "picture_url"
    t.string "public_profile_url"
    t.string "location"
    t.string "country"
    t.string "honors"
    t.string "associations"
  end

  create_table "positions", :force => true do |t|
    t.string   "linkedin_position_id"
    t.string   "title"
    t.text     "summary"
    t.string   "industry"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_current"
    t.string   "company"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
