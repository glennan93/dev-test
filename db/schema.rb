# frozen_string_literal: true

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

ActiveRecord::Schema[8.0].define(version: 20_250_712_010_210) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pg_catalog.plpgsql'

  create_table 'cars', force: :cascade do |t|
    t.string 'trim'
    t.integer 'count'
    t.bigint 'dealership_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'make_id', null: false
    t.bigint 'model_id', null: false
    t.bigint 'year_id', null: false
    t.index ['dealership_id'], name: 'index_cars_on_dealership_id'
    t.index ['make_id'], name: 'index_cars_on_make_id'
    t.index ['model_id'], name: 'index_cars_on_model_id'
    t.index ['year_id'], name: 'index_cars_on_year_id'
  end

  create_table 'dealerships', force: :cascade do |t|
    t.string 'name'
    t.string 'oem'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'makes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'models', force: :cascade do |t|
    t.string 'name'
    t.bigint 'make_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['make_id'], name: 'index_models_on_make_id'
  end

  create_table 'years', force: :cascade do |t|
    t.integer 'year'
    t.bigint 'make_id', null: false
    t.bigint 'model_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['make_id'], name: 'index_years_on_make_id'
    t.index ['model_id'], name: 'index_years_on_model_id'
  end

  add_foreign_key 'cars', 'dealerships'
  add_foreign_key 'cars', 'makes'
  add_foreign_key 'cars', 'models'
  add_foreign_key 'cars', 'years'
  add_foreign_key 'models', 'makes'
  add_foreign_key 'years', 'makes'
  add_foreign_key 'years', 'models'
end
