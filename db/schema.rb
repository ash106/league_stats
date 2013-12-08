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

ActiveRecord::Schema.define(version: 20131208003657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "summoner_id"
    t.integer  "game_num"
    t.integer  "ip_earned"
    t.integer  "ping"
    t.integer  "time_in_queue"
    t.integer  "champion_id"
    t.string   "queue_type"
    t.datetime "create_date"
    t.integer  "spell_one"
    t.integer  "spell_two"
    t.integer  "team_id"
    t.integer  "neutral_minions_killed_enemy_jungle"
    t.integer  "true_damage_dealt_to_champions"
    t.integer  "total_heal"
    t.integer  "ward_placed"
    t.integer  "assists"
    t.integer  "total_damage_dealt_to_champions"
    t.integer  "true_damage_taken"
    t.integer  "num_deaths"
    t.integer  "largest_killing_spree"
    t.integer  "magic_damage_dealt_player"
    t.integer  "true_damage_dealt_player"
    t.integer  "item_four"
    t.integer  "physical_damage_dealt_player"
    t.integer  "largest_multi_kill"
    t.integer  "item_two"
    t.integer  "neutral_minions_killed_your_jungle"
    t.integer  "physical_damage_taken"
    t.integer  "total_damage_taken"
    t.integer  "minions_killed"
    t.integer  "champions_killed"
    t.integer  "item_one"
    t.integer  "magic_damage_taken"
    t.integer  "physical_damage_dealt_to_champions"
    t.integer  "item_five"
    t.integer  "gold_earned"
    t.integer  "magic_damage_dealt_to_champions"
    t.integer  "item_six"
    t.integer  "total_time_spent_dead"
    t.integer  "neutral_minions_killed"
    t.integer  "level"
    t.integer  "item_zero"
    t.integer  "total_damage_dealt"
    t.integer  "sight_wards_bought_in_game"
    t.integer  "total_time_crowd_control_dealt"
    t.boolean  "win"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["summoner_id"], name: "index_games_on_summoner_id", using: :btree

  create_table "ownerships", force: true do |t|
    t.integer  "user_id"
    t.integer  "summoner_id"
    t.boolean  "is_owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ownerships", ["summoner_id"], name: "index_ownerships_on_summoner_id", using: :btree
  add_index "ownerships", ["user_id"], name: "index_ownerships_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "summoners", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "icon"
    t.string   "server"
    t.integer  "honor_friendly"
    t.integer  "honor_helpful"
    t.integer  "honor_teamwork"
    t.integer  "honor_opponent"
    t.integer  "lifetime_ip"
    t.string   "last_season"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
