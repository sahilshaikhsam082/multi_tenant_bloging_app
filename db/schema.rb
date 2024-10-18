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

ActiveRecord::Schema[7.0].define(version: 2024_10_18_221202) do
  create_table "blog_post_tags", force: :cascade do |t|
    t.integer "blog_post_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_blog_post_tags_on_blog_post_id"
    t.index ["tag_id"], name: "index_blog_post_tags_on_tag_id"
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "tenant_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "blog_id", null: false
    t.index ["blog_id"], name: "index_blog_posts_on_blog_id"
    t.index ["tenant_id"], name: "index_blog_posts_on_tenant_id"
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_blogs_on_tenant_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "blog_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_comments_on_blog_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_subscriptions_on_tenant_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["tenant_id"], name: "index_user_roles_on_tenant_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "role"
    t.integer "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["tenant_id"], name: "index_users_on_tenant_id"
  end

  create_table "versions", force: :cascade do |t|
    t.integer "blog_post_id", null: false
    t.text "content"
    t.integer "version_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_versions_on_blog_post_id"
  end

  add_foreign_key "blog_post_tags", "blog_posts"
  add_foreign_key "blog_post_tags", "tags"
  add_foreign_key "blog_posts", "blogs"
  add_foreign_key "blog_posts", "tenants"
  add_foreign_key "blog_posts", "users"
  add_foreign_key "blogs", "tenants"
  add_foreign_key "comments", "blog_posts"
  add_foreign_key "comments", "users"
  add_foreign_key "subscriptions", "tenants"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "tenants"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "tenants"
  add_foreign_key "versions", "blog_posts"
end
