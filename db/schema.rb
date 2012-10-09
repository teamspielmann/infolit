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

ActiveRecord::Schema.define(:version => 20121007111133) do

  create_table "feedbacks", :force => true do |t|
    t.decimal  "define_1"
    t.decimal  "define_2"
    t.decimal  "define_3"
    t.decimal  "define_t"
    t.decimal  "access_1"
    t.decimal  "access_2"
    t.decimal  "access_3"
    t.decimal  "access_4"
    t.decimal  "access_t"
    t.decimal  "evaluate_1"
    t.decimal  "evaluate_2"
    t.decimal  "evaluate_3"
    t.decimal  "evaluate_4"
    t.decimal  "evaluate_t"
    t.decimal  "use_1"
    t.decimal  "use_2"
    t.decimal  "use_t"
    t.decimal  "il_total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.string   "name"
  end

  create_table "information", :force => true do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.integer  "form"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "part_dbs", :force => true do |t|
    t.string "store_location"
    t.string "store_name"
    t.string "carmodel"
    t.string "part"
    t.string "keywords"
  end

  create_table "part_models", :force => true do |t|
    t.string "store_location"
    t.string "store_name"
    t.string "carmodel"
    t.string "part"
    t.string "keywords"
  end

  create_table "part_scores", :force => true do |t|
    t.integer  "vehicle_type"
    t.time     "start_time"
    t.time     "end_time"
    t.decimal  "time_taken"
    t.integer  "searches_count", :default => 0
    t.decimal  "score"
    t.integer  "task_completed"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "refine_count",   :default => 0
  end

  create_table "part_stores", :force => true do |t|
    t.string "store_location"
    t.string "store_name"
    t.string "carmodel"
    t.string "part"
    t.string "keywords"
  end

  create_table "present_titles", :force => true do |t|
    t.integer  "titlea"
    t.integer  "bodyb"
    t.integer  "bodyc"
    t.integer  "bodyd"
    t.integer  "bodye"
    t.integer  "bodyf"
    t.integer  "bodyg"
    t.integer  "bodyh"
    t.integer  "bodyi"
    t.integer  "bodyj"
    t.integer  "bodyk"
    t.integer  "sum_of_body"
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "questionnaires", :force => true do |t|
    t.integer  "ict_c_teacher"
    t.integer  "ict_no_teacher"
    t.integer  "internet_school"
    t.integer  "internet_outside"
    t.integer  "sharing_computer"
    t.text     "ict_opportunities_school"
    t.text     "ict_opportunities_out"
    t.integer  "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "research_as", :force => true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "research_bs", :force => true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "research_cs", :force => true do |t|
    t.integer  "score"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "teachers", :force => true do |t|
    t.string   "school"
    t.string   "gender"
    t.string   "age"
    t.string   "subject"
    t.string   "comp_work"
    t.string   "personal_use"
    t.string   "professional_use"
    t.text     "formal_training"
    t.text     "informal_training"
    t.text     "training_needs"
    t.text     "other_sources_student"
    t.integer  "eight1"
    t.integer  "eight2"
    t.integer  "eight3"
    t.integer  "eight4"
    t.integer  "eight5"
    t.integer  "eight6"
    t.integer  "eight7"
    t.integer  "eight8"
    t.integer  "nine1"
    t.integer  "nine2"
    t.integer  "nine3"
    t.integer  "nine4"
    t.integer  "nine5"
    t.integer  "ten1"
    t.integer  "ten2"
    t.integer  "ten3"
    t.integer  "ten4"
    t.integer  "ten5"
    t.integer  "ten6"
    t.integer  "eleven1"
    t.integer  "eleven2"
    t.integer  "eleven3"
    t.integer  "eleven4"
    t.integer  "eleven5"
    t.integer  "eleven6"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "school"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "taken",      :default => 0
  end

  create_table "video_scores", :force => true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.decimal  "time_taken"
    t.integer  "searches",       :default => 0
    t.decimal  "score"
    t.integer  "task_completed"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "refine_count",   :default => 0
  end

  create_table "videos", :force => true do |t|
    t.string "title"
    t.text   "description"
    t.string "keywords"
    t.string "length"
    t.string "chosen"
  end

  create_table "websites", :force => true do |t|
    t.integer  "most_reliable"
    t.integer  "most_reason"
    t.integer  "least_reliable"
    t.integer  "least_reason"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
