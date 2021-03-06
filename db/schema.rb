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

ActiveRecord::Schema.define(:version => 20110312202434) do

  create_table "appgroups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appgroup_id"
  end

  add_index "apps", ["appgroup_id"], :name => "index_apps_on_appgroup_id"

  create_table "entities", :force => true do |t|
    t.integer  "policy_id"
    t.boolean  "permit",          :default => false
    t.integer  "entityable_id"
    t.string   "entityable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appgroup_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["group_id", "user_id"], :name => "index_memberships_on_group_id_and_user_id"

  create_table "policies", :force => true do |t|
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", :force => true do |t|
    t.string   "name",       :limit => 2000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
  end

  add_index "resources", ["app_id"], :name => "index_resources_on_app_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id"
  end

  add_index "roles", ["app_id"], :name => "index_roles_on_app_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "appgroup_id"
  end

end
