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

ActiveRecord::Schema.define(version: 2021_11_19_205340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "cars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "immatriculation"
    t.string "couleur"
    t.integer "nbre_place"
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "depenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "nat_depense"
    t.text "description"
    t.integer "montant"
    t.date "date_depense"
    t.uuid "user_id", null: false
    t.uuid "car_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["car_id"], name: "index_depenses_on_car_id"
    t.index ["user_id"], name: "index_depenses_on_user_id"
  end

  create_table "inscriptions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.string "matricule"
    t.string "classe"
    t.integer "num_parent"
    t.integer "montant"
    t.string "mois"
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_inscriptions_on_user_id"
  end

  create_table "sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trajets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "destination"
    t.uuid "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trajets_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.string "email"
    t.string "telephone"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cars", "users"
  add_foreign_key "depenses", "cars"
  add_foreign_key "depenses", "users"
  add_foreign_key "inscriptions", "users"
  add_foreign_key "trajets", "users"
end
