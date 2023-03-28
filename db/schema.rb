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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_003215) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identifier_stocks", force: :cascade do |t|
    t.string "symbol_name"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "indices_stock_id"
    t.index ["indices_stock_id"], name: "index_identifier_stocks_on_indices_stock_id"
    t.index ["name"], name: "index_identifier_stocks_on_name"
    t.index ["symbol_name"], name: "index_identifier_stocks_on_symbol_name"
  end

  create_table "indices_stocks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_indices_stocks_on_name"
  end

  create_table "stocks", force: :cascade do |t|
    t.bigint "identifier_stock_id"
    t.string "stockable_type"
    t.bigint "stockable_id"
    t.integer "quantity", default: 0
    t.decimal "unit_price", precision: 10, scale: 2
    t.decimal "total_price", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier_stock_id"], name: "index_stocks_on_identifier_stock_id"
    t.index ["stockable_type", "stockable_id"], name: "index_stocks_on_stockable"
  end

  create_table "teams", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teams_on_email"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "sourceable_type"
    t.bigint "sourceable_id"
    t.string "targetable_type"
    t.bigint "targetable_id"
    t.integer "transaction_type", default: 0, null: false
    t.decimal "amount", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sourceable_id", "sourceable_type"], name: "index_transactions_on_sourceable_id_and_sourceable_type"
    t.index ["sourceable_type", "sourceable_id"], name: "index_transactions_on_sourceable"
    t.index ["targetable_id", "targetable_type"], name: "index_transactions_on_targetable_id_and_targetable_type"
    t.index ["targetable_type", "targetable_id"], name: "index_transactions_on_targetable"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wallet_transactions", force: :cascade do |t|
    t.bigint "transaction_id"
    t.bigint "wallet_id"
    t.integer "event", default: 0, null: false
    t.decimal "amount", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_wallet_transactions_on_transaction_id"
    t.index ["wallet_id"], name: "index_wallet_transactions_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "walletable_type"
    t.bigint "walletable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["walletable_id", "walletable_type"], name: "index_wallets_on_walletable_id_and_walletable_type"
    t.index ["walletable_type", "walletable_id"], name: "index_wallets_on_walletable"
  end

end
