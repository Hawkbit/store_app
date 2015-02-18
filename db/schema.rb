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

ActiveRecord::Schema.define(version: 20150218170257) do

  create_table "customers", primary_key: "customerNumber", force: true do |t|
    t.string  "customerName",           limit: 50, null: false
    t.string  "contactLastName",        limit: 50, null: false
    t.string  "contactFirstName",       limit: 50, null: false
    t.string  "phone",                  limit: 50, null: false
    t.string  "addressLine1",           limit: 50, null: false
    t.string  "addressLine2",           limit: 50
    t.string  "city",                   limit: 50, null: false
    t.string  "state",                  limit: 50
    t.string  "postalCode",             limit: 15
    t.string  "country",                limit: 50, null: false
    t.integer "salesRepEmployeeNumber"
    t.float   "creditLimit"
  end

  add_index "customers", ["salesRepEmployeeNumber"], name: "salesRepEmployeeNumber"

  create_table "database_structures", force: true do |t|
  end

  create_table "employees", primary_key: "employeeNumber", force: true do |t|
    t.string  "lastName",   limit: 50,  null: false
    t.string  "firstName",  limit: 50,  null: false
    t.string  "extension",  limit: 10,  null: false
    t.string  "email",      limit: 100, null: false
    t.string  "officeCode", limit: 10,  null: false
    t.integer "reportsTo"
    t.string  "jobTitle",   limit: 50,  null: false
  end

  add_index "employees", ["officeCode"], name: "officeCode"
  add_index "employees", ["reportsTo"], name: "reportsTo"

  create_table "offices", primary_key: "officeCode", force: true do |t|
    t.string "city",         limit: 50, null: false
    t.string "phone",        limit: 50, null: false
    t.string "addressLine1", limit: 50, null: false
    t.string "addressLine2", limit: 50
    t.string "state",        limit: 50
    t.string "country",      limit: 50, null: false
    t.string "postalCode",   limit: 15, null: false
    t.string "territory",    limit: 10, null: false
  end

  create_table "orderdetails", id: false, force: true do |t|
    t.integer "orderNumber",                null: false
    t.string  "productCode",     limit: 15, null: false
    t.integer "quantityOrdered",            null: false
    t.float   "priceEach",                  null: false
    t.integer "orderLineNumber", limit: 2,  null: false
  end

  add_index "orderdetails", ["productCode"], name: "productCode"

  create_table "orders", primary_key: "orderNumber", force: true do |t|
    t.date    "orderDate",                 null: false
    t.date    "requiredDate",              null: false
    t.date    "shippedDate"
    t.string  "status",         limit: 15, null: false
    t.text    "comments"
    t.integer "customerNumber",            null: false
  end

  add_index "orders", ["customerNumber"], name: "customerNumber"

  create_table "payments", id: false, force: true do |t|
    t.integer "customerNumber",            null: false
    t.string  "checkNumber",    limit: 50, null: false
    t.date    "paymentDate",               null: false
    t.float   "amount",                    null: false
  end

  create_table "productlines", force: true do |t|
    t.string "productLine",     limit: 70,       null: false
    t.string "textDescription", limit: 4000
    t.text   "htmlDescription", limit: 16777215
    t.binary "image",           limit: 16777215
  end

  create_table "products", force: true do |t|
    t.string  "productCode",        limit: 70, null: false
    t.string  "productName",        limit: 70, null: false
    t.string  "productLine",        limit: 50, null: false
    t.string  "productScale",       limit: 10, null: false
    t.string  "productVendor",      limit: 50, null: false
    t.text    "productDescription",            null: false
    t.integer "quantityInStock",    limit: 2,  null: false
    t.float   "buyPrice",                      null: false
    t.float   "MSRP",                          null: false
  end

end
