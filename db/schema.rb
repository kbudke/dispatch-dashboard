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

ActiveRecord::Schema.define(version: 20161110070445) do

  create_table "bill_of_ladings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "invoice_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "companyName"
    t.string   "companyAddress"
    t.string   "companyBillingAddress"
    t.string   "companyCustomId"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
  end

  create_table "delivery_trucks", force: :cascade do |t|
    t.string   "name"
    t.float    "minimumPossibleWeight"
    t.float    "maximumPossibleWeight"
    t.string   "vinNumber"
    t.string   "origin"
    t.string   "destination"
    t.integer  "yearManufactured"
    t.string   "make"
    t.string   "model"
    t.float    "payloadEmptyWeight"
    t.string   "originLocation"
    t.string   "currentLocation"
    t.string   "destinationLocation"
    t.string   "weightCapacity"
    t.integer  "yearAquired"
    t.text     "carFax"
    t.text     "maintenanceHistory"
    t.text     "nextMaintenance"
    t.float    "highwayMPG"
    t.float    "cityMPG"
    t.float    "avgMPG"
    t.string   "scheduledDepartureTime"
    t.string   "estimatedArrivalTime"
    t.string   "requestedArrivalTime"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image"
    t.string   "currentState"
    t.string   "driverId"
    t.integer  "occupied_slots"
    t.integer  "currentWeight"
    t.integer  "user_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "driver_name"
    t.string   "driver_id"
    t.string   "driver_dob"
    t.text     "driver_address"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "trailer_capacity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "image"
    t.integer  "user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "client"
    t.integer  "truck_id"
    t.integer  "userId"
    t.decimal  "total"
    t.text     "invoice_items"
    t.string   "dispatchdate"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "invoicing_ledger_items", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "type"
    t.datetime "issue_date"
    t.string   "currency",     limit: 3,                           null: false
    t.decimal  "total_amount",            precision: 20, scale: 4
    t.decimal  "tax_amount",              precision: 20, scale: 4
    t.string   "status",       limit: 20
    t.string   "identifier",   limit: 50
    t.string   "description"
    t.datetime "period_start"
    t.datetime "period_end"
    t.string   "uuid",         limit: 40
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoicing_line_items", force: :cascade do |t|
    t.integer  "ledger_item_id"
    t.string   "type"
    t.decimal  "net_amount",                precision: 20, scale: 4
    t.decimal  "tax_amount",                precision: 20, scale: 4
    t.string   "description"
    t.string   "uuid",           limit: 40
    t.datetime "tax_point"
    t.decimal  "quantity",                  precision: 20, scale: 4
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoicing_tax_rates", force: :cascade do |t|
    t.string   "description"
    t.decimal  "rate",           precision: 20, scale: 4
    t.datetime "valid_from",                              null: false
    t.datetime "valid_until"
    t.integer  "replaced_by_id"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.decimal  "bid_total"
    t.integer  "order_id"
    t.string   "dispatch_date"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "truck_id"
    t.string   "company_name"
    t.string   "company_billing_address"
    t.string   "origin"
    t.string   "destination"
    t.string   "vin"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal"
    t.decimal  "sales_tax"
    t.decimal  "grand_total"
    t.integer  "user_id"
    t.text     "order_items"
    t.integer  "truck_id"
    t.datetime "dispatch_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "driver_id"
    t.string   "currentState"
    t.datetime "start_time"
  end

  create_table "pickups", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "role"
    t.string   "phone_number"
    t.text     "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.integer  "yearManufactured"
    t.string   "origin"
    t.string   "destination"
    t.string   "vinNumber"
    t.float    "minimumPossibleWeight"
    t.float    "maximumPossibleWeight"
    t.float    "actualWeight"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.float    "origin_latitude"
    t.float    "origin_longitude"
    t.float    "destination_latitude"
    t.float    "destination_longitude"
    t.float    "distance"
    t.string   "truck_id"
    t.string   "image"
    t.text     "details"
    t.string   "remote_image_url"
    t.string   "customername"
    t.string   "currentState"
    t.string   "billingAddress"
    t.string   "company_id"
    t.integer  "user_id"
  end

end
