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

ActiveRecord::Schema.define(version: 20171120184841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.string   "supplier"
    t.float    "value"
    t.datetime "due_date"
    t.integer  "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_expenses_on_seller_id", using: :btree
  end

  create_table "installments", force: :cascade do |t|
    t.string   "number"
    t.float    "value"
    t.date     "due_date"
    t.integer  "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_installments_on_invoice_id", using: :btree
  end

  create_table "investors", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "address"
    t.string   "address_number"
    t.string   "address_complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "invoice_payers", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "address"
    t.string   "adress_number"
    t.string   "address_complement"
    t.string   "phone_number"
    t.string   "state"
    t.string   "zip_code"
    t.string   "neighborhood"
    t.string   "city"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "number"
    t.float    "total_value"
    t.integer  "seller_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["seller_id"], name: "index_invoices_on_seller_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "investor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["investor_id"], name: "index_orders_on_investor_id", using: :btree
    t.index ["invoice_id"], name: "index_orders_on_invoice_id", using: :btree
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "name"
    t.string   "address"
    t.string   "address_number"
    t.string   "city"
    t.string   "neighborhood"
    t.string   "zip_code"
    t.string   "state"
    t.integer  "number_of_employees"
    t.string   "phone_number"
    t.string   "address_complement"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "cpf"
    t.string   "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "expenses", "sellers"
  add_foreign_key "installments", "invoices"
  add_foreign_key "invoices", "sellers"
  add_foreign_key "orders", "investors"
  add_foreign_key "orders", "invoices"
end
