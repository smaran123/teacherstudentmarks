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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151027104928) do

  create_table "admins", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "mobile_number", limit: 255
    t.date     "date_of_birth"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "batches", force: :cascade do |t|
    t.string   "batch_name", limit: 255
    t.integer  "admin_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "status",     limit: 255
  end

  add_index "batches", ["admin_id"], name: "index_batches_on_admin_id", using: :btree

  create_table "markreports", force: :cascade do |t|
    t.integer  "student_id",  limit: 4
    t.integer  "teacher_id",  limit: 4
    t.integer  "subject_id",  limit: 4
    t.integer  "max_marks",   limit: 4
    t.float    "total_marks", limit: 24
    t.string   "result",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "mobile_number", limit: 255
    t.date     "date_of_birth"
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name", limit: 255
    t.integer  "batch_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "assign",       limit: 255
  end

  add_index "subjects", ["batch_id"], name: "index_subjects_on_batch_id", using: :btree

  create_table "teacherclasses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "batch_id",   limit: 4
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "teacher_id", limit: 4
  end

  create_table "teachers", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "first_name",    limit: 255
    t.string   "last_name",     limit: 255
    t.string   "mobile_number", limit: 255
    t.date     "date_of_birth"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "mobile_number",          limit: 255
    t.date     "date_of_birth"
    t.string   "role",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "batches", "admins"
  add_foreign_key "subjects", "batches"
end
