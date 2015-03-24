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

ActiveRecord::Schema.define(version: 20150119183322) do

  create_table "business", force: true do |t|
    t.string "name",     limit: 45
    t.string "address",  limit: 45
    t.string "phone",    limit: 45
    t.string "email",    limit: 45
    t.string "web",      limit: 45
    t.string "category", limit: 45
  end

  create_table "businesses", force: true do |t|
    t.string  "name",     limit: 45
    t.string  "address",  limit: 45
    t.string  "phone",    limit: 45
    t.string  "email",    limit: 45
    t.string  "web",      limit: 45
    t.string  "category", limit: 45
    t.boolean "status"
  end

  create_table "categories", force: true do |t|
    t.string  "name"
    t.boolean "status"
  end

  create_table "coupons", force: true do |t|
    t.datetime "purchase_date"
    t.datetime "expiration_date"
    t.integer  "is_expired",      limit: 1
    t.integer  "is_used",         limit: 1
    t.float    "cost"
    t.string   "uid"
    t.integer  "deal_id"
    t.string   "user_id",         limit: 45
  end

  add_index "coupons", ["deal_id"], name: "fk_Coupon_Deal1_idx", using: :btree
  add_index "coupons", ["user_id"], name: "fk_Coupon_User1_idx", using: :btree

  create_table "deals", force: true do |t|
    t.datetime "from"
    t.datetime "to"
    t.float    "discount"
    t.float    "per_business"
    t.float    "per_npo"
    t.float    "per_givcuz"
    t.integer  "featured",                  limit: 1
    t.integer  "active",                    limit: 1
    t.integer  "is_daily_deal",             limit: 1
    t.integer  "coupon_expires_after_days"
    t.integer  "max_coupons_offered"
    t.integer  "max_coupons_per_user",                default: 1
    t.integer  "product_id",                                      null: false
    t.integer  "npo_id"
    t.boolean  "status"
    t.string   "external_cupon_code"
    t.string   "link_external_code"
  end

  add_index "deals", ["npo_id"], name: "fk_Deal_NPO1_idx", using: :btree
  add_index "deals", ["product_id"], name: "fk_Deal_Product_idx", using: :btree

  create_table "images", force: true do |t|
    t.string  "url"
    t.string  "image_holder_type"
    t.integer "image_holder_id"
  end

  create_table "npos", force: true do |t|
    t.string  "name",    limit: 90
    t.string  "address", limit: 90
    t.string  "phone",   limit: 45
    t.string  "email",   limit: 45
    t.string  "web",     limit: 45
    t.boolean "status"
  end

  create_table "products", force: true do |t|
    t.string  "name",        limit: 90
    t.string  "description"
    t.float   "price"
    t.string  "code",        limit: 45
    t.integer "business_id"
    t.integer "category_id"
    t.boolean "status"
  end

  add_index "products", ["business_id"], name: "fk_Product_Business1_idx", using: :btree

  create_table "users", force: true do |t|
    t.string   "user_type",              limit: 45
    t.string   "username",               limit: 45
    t.string   "password",               limit: 45
    t.string   "user_management_type"
    t.integer  "user_management_id"
    t.string   "email"
    t.string   "encrypted_password",                default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "npo_id"
    t.integer  "business_id"
    t.boolean  "status",                            default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
