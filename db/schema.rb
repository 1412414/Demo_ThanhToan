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

ActiveRecord::Schema.define(version: 20171224093042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auction_details", force: :cascade do |t|
    t.bigint "customers_of_auction_id"
    t.string "bid_time"
    t.integer "bid_amount"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customers_of_auction_id"], name: "index_auction_details_on_customers_of_auction_id"
  end

  create_table "auctions", force: :cascade do |t|
    t.string "ending_time"
    t.string "starting_time"
    t.integer "starting_price"
    t.integer "current_price"
    t.integer "max_price"
    t.integer "buy_it_now_price"
    t.integer "bid_increment"
    t.integer "status"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_auctions_on_product_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "employee_id"
    t.string "complaint_day"
    t.integer "handled"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_complaints_on_customer_id"
    t.index ["employee_id"], name: "index_complaints_on_employee_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "customer_type"
    t.string "address"
    t.string "shipping_address"
    t.integer "negative_points"
    t.integer "positive_points"
    t.string "total_transactions"
    t.bigint "blocker_id"
    t.string "blocking_time"
    t.integer "number_of_created_products_in_a_month"
    t.string "paypal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blocker_id"], name: "index_customers_on_blocker_id"
  end

  create_table "customers_of_auctions", force: :cascade do |t|
    t.bigint "auction_id"
    t.bigint "customer_id"
    t.integer "max_bid_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_customers_of_auctions_on_auction_id"
    t.index ["customer_id"], name: "index_customers_of_auctions_on_customer_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "employees", force: :cascade do |t|
    t.string "employee_name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_lists", primary_key: ["customer_id", "auction_id"], force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "auction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_favorite_lists_on_auction_id"
    t.index ["customer_id"], name: "index_favorite_lists_on_customer_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "receipt_id"
    t.integer "card_number"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_invoices_on_receipt_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "sending_time"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_notifications_on_customer_id"
  end

  create_table "product_examinations", force: :cascade do |t|
    t.string "examination_time"
    t.bigint "product_id"
    t.bigint "employee_id"
    t.string "reason"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_product_examinations_on_employee_id"
    t.index ["product_id"], name: "index_product_examinations_on_product_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "product_type_name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_types_on_category_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "description"
    t.bigint "product_type_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_products_on_customer_id"
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "auction_id"
    t.bigint "customer_id"
    t.string "card_number"
    t.integer "product_received"
    t.integer "status"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auction_id"], name: "index_receipts_on_auction_id"
    t.index ["customer_id"], name: "index_receipts_on_customer_id"
  end

  create_table "reports", primary_key: ["receipt_id", "reporter_id", "reported_customer_id"], force: :cascade do |t|
    t.bigint "receipt_id", null: false
    t.bigint "reporter_id", null: false
    t.bigint "reported_customer_id", null: false
    t.string "reason"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_reports_on_employee_id"
    t.index ["receipt_id"], name: "index_reports_on_receipt_id"
    t.index ["reported_customer_id"], name: "index_reports_on_reported_customer_id"
    t.index ["reporter_id"], name: "index_reports_on_reporter_id"
  end

  create_table "reviews", primary_key: ["reviewer_id", "reviewed_customer_id", "receipt_id"], force: :cascade do |t|
    t.bigint "reviewer_id", null: false
    t.bigint "reviewed_customer_id", null: false
    t.bigint "receipt_id", null: false
    t.integer "review_type"
    t.string "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_reviews_on_receipt_id"
    t.index ["reviewed_customer_id"], name: "index_reviews_on_reviewed_customer_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  add_foreign_key "auction_details", "customers_of_auctions"
  add_foreign_key "auctions", "products"
  add_foreign_key "complaints", "customers"
  add_foreign_key "complaints", "employees"
  add_foreign_key "customers", "employees", column: "blocker_id"
  add_foreign_key "customers_of_auctions", "auctions"
  add_foreign_key "customers_of_auctions", "customers"
  add_foreign_key "favorite_lists", "auctions"
  add_foreign_key "favorite_lists", "customers"
  add_foreign_key "images", "products"
  add_foreign_key "invoices", "receipts"
  add_foreign_key "notifications", "customers"
  add_foreign_key "product_examinations", "employees"
  add_foreign_key "product_examinations", "products"
  add_foreign_key "product_types", "categories"
  add_foreign_key "products", "customers"
  add_foreign_key "products", "product_types"
  add_foreign_key "receipts", "auctions"
  add_foreign_key "receipts", "customers"
  add_foreign_key "reports", "customers", column: "reported_customer_id"
  add_foreign_key "reports", "customers", column: "reporter_id"
  add_foreign_key "reports", "employees"
  add_foreign_key "reports", "receipts"
  add_foreign_key "reviews", "customers", column: "reviewed_customer_id"
  add_foreign_key "reviews", "customers", column: "reviewer_id"
  add_foreign_key "reviews", "receipts"
end
