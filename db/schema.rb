# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_02_23_180744) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "email_servers", force: :cascade do |t|
    t.string "name", null: false
    t.string "provider", null: false
    t.string "email", null: false
    t.string "imap_server", null: false
    t.integer "imap_port", null: false
    t.boolean "imap_ssl", null: false
    t.string "password"
    t.bigint "user_id", null: false
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_email_servers_on_team_id"
    t.index ["user_id"], name: "index_email_servers_on_user_id"
  end

  create_table "invite_codes", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_invite_codes_on_token", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "avatar_url"
    t.bigint "workspace_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workspace_id"], name: "index_teams_on_workspace_id"
  end

  create_table "teams_users", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_teams_users_on_team_id"
    t.index ["user_id"], name: "index_teams_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id", null: false
    t.index ["owner_id"], name: "index_workspaces_on_owner_id"
  end

  create_table "workspaces_users", force: :cascade do |t|
    t.bigint "workspace_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workspaces_users_on_user_id"
    t.index ["workspace_id"], name: "index_workspaces_users_on_workspace_id"
  end

  add_foreign_key "email_servers", "teams"
  add_foreign_key "email_servers", "users"
  add_foreign_key "teams", "workspaces"
  add_foreign_key "teams_users", "teams"
  add_foreign_key "teams_users", "users"
  add_foreign_key "workspaces", "users", column: "owner_id"
  add_foreign_key "workspaces_users", "users"
  add_foreign_key "workspaces_users", "workspaces"
end
