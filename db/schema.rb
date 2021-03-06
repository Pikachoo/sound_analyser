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

ActiveRecord::Schema.define(version: 20161117135956) do

  create_table "sound_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file"
    t.string   "directory"
    t.string   "file_signature"
    t.string   "file_hash"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sounds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "sound_file_id"
    t.integer  "canal_number"
    t.integer  "select_size"
    t.integer  "spectral_number"
    t.integer  "frequency"
    t.float    "frequency_extension",  limit: 24
    t.float    "block_time",           limit: 24
    t.integer  "general_time"
    t.integer  "user_blocks_number"
    t.integer  "data_size"
    t.integer  "system_blocks_number"
    t.float    "max_signal",           limit: 24
    t.float    "min_signal",           limit: 24
    t.binary   "data",                 limit: 4294967295
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
