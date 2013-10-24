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

ActiveRecord::Schema.define(:version => 20130521164738) do

  create_table "emergencies", :force => true do |t|
    t.integer  "emergencies_types_id"
    t.datetime "emergency_start"
    t.datetime "emergency_end"
    t.text     "management_description"
    t.text     "comments"
    t.integer  "zones_id"
    t.integer  "level"
  end

  add_index "emergencies", ["emergencies_types_id"], :name => "emergencies_types_FK_idx"
  add_index "emergencies", ["zones_id"], :name => "zones_FK_idx"

  create_table "emergencies_types", :force => true do |t|
    t.string "name", :limit => 45
  end

  create_table "emergencies_types_users", :force => true do |t|
    t.integer "emergencies_users_id"
    t.integer "emergencies_types_id"
    t.integer "level",                :limit => 1
  end

  add_index "emergencies_types_users", ["emergencies_types_id"], :name => "emergencies_types_idx"
  add_index "emergencies_types_users", ["emergencies_users_id"], :name => "emergencies_users_FK_idx"

  create_table "emergencies_users", :force => true do |t|
    t.integer "roles_id"
    t.string  "name",      :limit => 45
    t.string  "last_name", :limit => 45
    t.string  "phone",     :limit => 45
    t.string  "address",   :limit => 45
    t.integer "level"
  end

  add_index "emergencies_users", ["roles_id"], :name => "roles_FK_idx"

  create_table "notifications", :force => true do |t|
    t.integer "emergencies_id"
    t.integer "emergencies_users_id"
  end

  add_index "notifications", ["emergencies_id"], :name => "emergencies_FK_idx"
  add_index "notifications", ["emergencies_users_id"], :name => "emergencies_users_notifications_FK_idx"

  create_table "profiles", :force => true do |t|
    t.string "name", :limit => 45
  end

  create_table "resources", :force => true do |t|
    t.integer "resources_types_id"
    t.string  "status",             :limit => 100
    t.string  "serial",             :limit => 100
  end

  add_index "resources", ["resources_types_id"], :name => "resources_typs_FK_idx"

  create_table "resources_types", :force => true do |t|
    t.string "name", :limit => 45
  end

  create_table "resources_zones", :force => true do |t|
    t.integer "zone_id"
    t.integer "resource_id"
    t.integer "emergencies_types_id"
  end

  add_index "resources_zones", ["emergencies_types_id"], :name => "emergencies_types_FK_idx"
  add_index "resources_zones", ["resource_id"], :name => "resources_FK_idx"
  add_index "resources_zones", ["zone_id"], :name => "resources__idx"

  create_table "roles", :force => true do |t|
    t.string "name", :limit => 45
  end

  create_table "system_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
  end

  add_index "system_users", ["email"], :name => "index_system_users_on_email", :unique => true
  add_index "system_users", ["reset_password_token"], :name => "index_system_users_on_reset_password_token", :unique => true

  create_table "zones", :force => true do |t|
    t.string "name", :limit => 45
  end

end
