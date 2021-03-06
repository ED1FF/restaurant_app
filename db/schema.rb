# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_201_205_151_050) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'city_id'
    t.string 'street'
    t.bigint 'addressable_id'
    t.string 'addressable_type'
    t.string 'notes'
    t.string 'phone_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable_type_and_addressable_id'
    t.index ['city_id'], name: 'index_addresses_on_city_id'
  end

  create_table 'cities', force: :cascade do |t|
    t.string 'country'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.float 'cost'
    t.string 'description'
    t.bigint 'restaurant_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['restaurant_id'], name: 'index_items_on_restaurant_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.bigint 'order_id'
    t.bigint 'item_id'
    t.integer 'quantity'
    t.float 'subtotal'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['item_id'], name: 'index_order_items_on_item_id'
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'restaurant_id'
    t.datetime 'visit_at'
    t.integer 'category', default: 0
    t.integer 'status', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['restaurant_id'], name: 'index_orders_on_restaurant_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'restaurants', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.bigint 'city_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city_id'], name: 'index_restaurants_on_city_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.string 'phone_number', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'admin', default: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'items', 'restaurants'
  add_foreign_key 'order_items', 'items'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'orders', 'restaurants'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'restaurants', 'cities'
end
