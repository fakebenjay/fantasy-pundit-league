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

ActiveRecord::Schema.define(version: 20171212061849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "defenses", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.float "td"
    t.float "int"
    t.float "fr"
    t.float "sck"
    t.float "sfty"
    t.float "blk"
    t.float "pa"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flexes", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "team"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.string "comp_att"
    t.float "pass_yds"
    t.float "pass_td"
    t.float "int"
    t.float "rush_att"
    t.float "rush_yds"
    t.float "rush_td"
    t.float "rec"
    t.float "rec_yds"
    t.float "rec_td"
    t.float "tar"
    t.float "two_pc"
    t.float "fuml"
    t.float "misc_td"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kickers", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "team"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.string "thirty"
    t.string "forty"
    t.string "fifty"
    t.string "fg"
    t.string "xp"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quarterbacks", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "team"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.string "comp_att"
    t.float "pass_yds"
    t.float "pass_td"
    t.float "int"
    t.float "rush_att"
    t.float "rush_yds"
    t.float "rush_td"
    t.float "rec"
    t.float "rec_yds"
    t.float "rec_td"
    t.float "tar"
    t.float "two_pc"
    t.float "fuml"
    t.float "misc_td"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "running_backs", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "team"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.string "comp_att"
    t.float "pass_yds"
    t.float "pass_td"
    t.float "int"
    t.float "rush_att"
    t.float "rush_yds"
    t.float "rush_td"
    t.float "rec"
    t.float "rec_yds"
    t.float "rec_td"
    t.float "tar"
    t.float "two_pc"
    t.float "fuml"
    t.float "misc_td"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.integer "week"
    t.string "quality"
    t.string "qb_name"
    t.float "qb_points"
    t.string "rb1_name"
    t.float "rb1_points"
    t.string "rb2_name"
    t.float "rb2_points"
    t.string "wr1_name"
    t.float "wr1_points"
    t.string "wr2_name"
    t.float "wr2_points"
    t.string "te_name"
    t.float "te_points"
    t.string "flex_name"
    t.float "flex_points"
    t.string "dst_name"
    t.float "dst_points"
    t.string "k_name"
    t.float "k_points"
    t.float "total_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tight_ends", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "team"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.string "comp_att"
    t.float "pass_yds"
    t.float "pass_td"
    t.float "int"
    t.float "rush_att"
    t.float "rush_yds"
    t.float "rush_td"
    t.float "rec"
    t.float "rec_yds"
    t.float "rec_td"
    t.float "tar"
    t.float "two_pc"
    t.float "fuml"
    t.float "misc_td"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wide_receivers", force: :cascade do |t|
    t.string "name"
    t.string "search_name"
    t.string "team"
    t.string "position"
    t.string "status"
    t.string "opp"
    t.integer "week"
    t.string "comp_att"
    t.float "pass_yds"
    t.float "pass_td"
    t.float "int"
    t.float "rush_att"
    t.float "rush_yds"
    t.float "rush_td"
    t.float "rec"
    t.float "rec_yds"
    t.float "rec_td"
    t.float "tar"
    t.float "two_pc"
    t.float "fuml"
    t.float "misc_td"
    t.float "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
