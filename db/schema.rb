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

ActiveRecord::Schema.define(version: 0) do

  create_table "account_followers", primary_key: "record_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "main_account_id", limit: 15, default: "", null: false
    t.string "follower_account_id", limit: 15, default: "", null: false
  end

  create_table "accounts", primary_key: "account_id", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "username", limit: 100
    t.string "full_name", limit: 100
    t.text "biography"
    t.string "external_link"
    t.text "avatar_url"
    t.integer "media_count", unsigned: true
    t.integer "followers_count", unsigned: true
    t.integer "follows_count", unsigned: true
    t.integer "is_private", unsigned: true
    t.integer "is_verified", unsigned: true
    t.integer "main_time_posts", limit: 2, default: 0, null: false, unsigned: true
    t.datetime "last_post_date"
    t.string "status", limit: 100, default: "ready"
    t.datetime "created_at", comment: "Время создания аккаунта в инсте"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "comments", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "post_id", null: false, unsigned: true
    t.integer "account_id", null: false, unsigned: true
    t.text "text", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"], name: "account_id"
    t.index ["post_id"], name: "comments_ibfk_1"
  end

  create_table "followers", id: :bigint, comment: "id фоловера", unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "account_id", null: false, comment: "Юзер, за которым следует фолловер", unsigned: true
    t.text "username", limit: 255, null: false
    t.text "caption", limit: 255, null: false
    t.integer "posts_count", limit: 2, default: 0, null: false
    t.integer "followers_count", limit: 2, default: 0, null: false
    t.text "avatar_url"
    t.integer "selection_id", null: false, unsigned: true
    t.index ["account_id"], name: "followers_ibfk_1"
    t.index ["id"], name: "id", unique: true
  end

  create_table "likes", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id", null: false, unsigned: true
    t.integer "account_id", null: false, unsigned: true
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"], name: "likes_ibfk_2"
    t.index ["post_id"], name: "likes_ibfk_1"
  end

  create_table "locations", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "post_id", null: false, unsigned: true
    t.text "name", null: false
    t.index ["post_id"], name: "locations_ibfk_1"
  end

  create_table "migrations", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "migration", limit: 191, null: false
    t.integer "batch", null: false
  end

  create_table "password_resets", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", limit: 191, null: false
    t.string "token", limit: 191, null: false
    t.timestamp "created_at"
    t.index ["email"], name: "password_resets_email_index"
  end

  create_table "posts", primary_key: "post_id", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "account_id", null: false, unsigned: true
    t.string "caption", limit: 200
    t.string "location", limit: 100
    t.string "short_code", limit: 100
    t.integer "likes_count", limit: 2, default: 0, null: false, unsigned: true
    t.integer "comments_count", limit: 2, default: 0, null: false, unsigned: true
    t.text "link"
    t.text "hr_image"
    t.text "thumb_image", null: false
    t.string "media_type", limit: 100
    t.text "tags"
    t.integer "er", limit: 1, null: false, unsigned: true
    t.timestamp "created_at", comment: "Время создания поста в инсте"
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["account_id"], name: "posts_ibfk_1"
  end

  create_table "proxy_list", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ADDRESS_PROXY", null: false
    t.integer "PORT_PROXY", null: false
    t.string "TYPE", limit: 10, null: false
    t.boolean "TUNNEL_PROXY"
    t.integer "TIMEOUT_PROXY"
    t.boolean "IS_USED", null: false
    t.datetime "LAST_USED"
    t.boolean "IS_LIVE", null: false, unsigned: true
  end

  create_table "selections", primary_key: "selection_id", id: :bigint, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "account_id", null: false, unsigned: true
    t.text "name", null: false
    t.index ["account_id"], name: "selections_ibfk_1"
  end

  create_table "users", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.string "password", limit: 191, null: false
    t.string "remember_token", limit: 100
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["email"], name: "users_email_unique", unique: true
  end

  add_foreign_key "comments", "posts", primary_key: "post_id", name: "comments_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "likes", "posts", primary_key: "post_id", name: "likes_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "locations", "posts", primary_key: "post_id", name: "locations_ibfk_1", on_update: :cascade, on_delete: :cascade
end
