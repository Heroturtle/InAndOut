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

ActiveRecord::Schema.define(version: 20141007174858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exchange_rates", force: true do |t|
    t.string   "currency_code"
    t.date     "date"
    t.decimal  "conversion_rate", precision: 12, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exchange_rates", ["currency_code", "date"], name: "index_exchange_rates_on_currency_code_and_date", unique: true, using: :btree
  add_index "exchange_rates", ["currency_code"], name: "index_exchange_rates_on_currency_code", using: :btree
  add_index "exchange_rates", ["date"], name: "index_exchange_rates_on_date", using: :btree

  create_table "expenses", force: true do |t|
    t.string   "invoice_number"
    t.decimal  "amount",             precision: 12, scale: 2
    t.string   "currency_code"
    t.date     "transaction_date"
    t.date     "payment_date"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "payment_account_id"
  end

  add_index "expenses", ["transaction_date"], name: "index_expenses_on_transaction_date", using: :btree

  create_table "payment_accounts", force: true do |t|
    t.string   "name"
    t.string   "account_number"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revenues", force: true do |t|
    t.string   "invoice_number"
    t.decimal  "amount",           precision: 12, scale: 2
    t.string   "currency_code"
    t.date     "transaction_date"
    t.date     "payment_date"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "revenues", ["transaction_date"], name: "index_revenues_on_transaction_date", using: :btree

end
