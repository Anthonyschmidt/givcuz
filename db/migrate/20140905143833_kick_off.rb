class KickOff < ActiveRecord::Migration
  def change
    create_table "NPO", force: true do |t|
      t.string "name",    limit: 90
      t.string "address", limit: 90
      t.string "phone",   limit: 45
      t.string "email",   limit: 45
      t.string "web",     limit: 45
    end

    create_table "business", force: true do |t|
      t.string "name",     limit: 45
      t.string "address",  limit: 45
      t.string "phone",    limit: 45
      t.string "email",    limit: 45
      t.string "web",      limit: 45
      t.string "category", limit: 45
    end

    create_table "coupons", force: true do |t|
      t.timestamp "purchase_date"
      t.datetime  "expiration_date"
      t.integer   "is_expired",      limit: 1
      t.integer   "is_used",         limit: 1
      t.float     "cost"
      t.string    "uid"
      t.integer   "deal_id"
      t.string    "user_id",         limit: 45
    end

    add_index "coupons", ["deal_id"], name: "fk_Coupon_Deal1_idx", using: :btree
    add_index "coupons", ["user_id"], name: "fk_Coupon_User1_idx", using: :btree

    create_table "deals", force: true do |t|
      t.datetime "from"
      t.datetime "to"
      t.float    "discount"
      t.float    "per_bussiness"
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
    end

    add_index "deals", ["npo_id"], name: "fk_Deal_NPO1_idx", using: :btree
    add_index "deals", ["product_id"], name: "fk_Deal_Product_idx", using: :btree

    create_table "products", force: true do |t|
      t.string  "name",        limit: 90
      t.string  "description"
      t.float   "price"
      t.string  "code",        limit: 45
      t.integer "business_id"
    end

    add_index "products", ["business_id"], name: "fk_Product_Business1_idx", using: :btree

    create_table "users", force: true do |t|
      t.string "type",     limit: 45
      t.string "username", limit: 45
      t.string "password", limit: 45
    end
  end
end
