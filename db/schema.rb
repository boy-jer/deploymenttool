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

ActiveRecord::Schema.define(:version => 20120826233206) do

  create_table "audiences", :force => true do |t|
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "brands", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "color"
    t.integer  "mid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.string   "data_file"
    t.date     "drop_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "round"
    t.integer  "brand_id"
    t.boolean  "counts_approval"
    t.string   "suppressions"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "send_lists", :force => true do |t|
    t.integer  "brand_id"
    t.integer  "list_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "versions", :force => true do |t|
    t.string   "creative"
    t.integer  "audience_id"
    t.string   "subject_line"
    t.string   "from"
    t.boolean  "creative_approval"
    t.integer  "campaign_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end