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

ActiveRecord::Schema.define(:version => 20130110003658) do

  create_table "directors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "films", :force => true do |t|
    t.string   "title"
    t.date     "year"
    t.integer  "rating"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "watched"
    t.string   "youtube"
    t.boolean  "dvd"
    t.boolean  "bluray"
    t.boolean  "drive"
    t.string   "buy"
    t.string   "streaming"
    t.integer  "studio_id"
    t.integer  "director_id"
  end

  add_index "films", ["director_id"], :name => "index_films_on_director_id"
  add_index "films", ["studio_id"], :name => "index_films_on_studio_id"

  create_table "studios", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
