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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160129223232) do
=======
ActiveRecord::Schema.define(version: 20160125231326) do
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url"
    t.text     "content"
    t.integer  "sub_id",     null: false
    t.integer  "author_id",  null: false
=======
  create_table "contact_shares", force: :cascade do |t|
    t.integer  "contact_id", null: false
    t.integer  "user_id",    null: false
>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["sub_id"], name: "index_posts_on_sub_id", using: :btree

  create_table "subs", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description"
    t.integer  "moderator_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "subs", ["moderator_id"], name: "index_subs_on_moderator_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

=======
  add_index "contact_shares", ["contact_id", "user_id"], name: "index_contact_shares_on_contact_id_and_user_id", unique: true, using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["email"], name: "index_contacts_on_email", unique: true, using: :btree
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username"
  end

>>>>>>> df507360b6b87b8b4b69fe0523f2dca32d06e03e
end
