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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130130163058) do

  create_table "divisions", :force => true do |t|
    t.integer  "league_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "leagues", :force => true do |t|
    t.integer  "season_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "team_id"
    t.string   "surname"
    t.string   "given_name"
    t.string   "throws"
    t.string   "position"
    t.string   "wins"
    t.string   "losses"
    t.string   "saves"
    t.string   "games"
    t.string   "games_started"
    t.string   "complete_games"
    t.string   "shut_outs"
    t.string   "era"
    t.string   "innings"
    t.string   "home_runs"
    t.string   "runs"
    t.string   "earned_runs"
    t.string   "hit_batter"
    t.string   "wild_pitchers"
    t.string   "balk"
    t.string   "walked_batter"
    t.string   "struck_out_batter"
    t.string   "at_bats"
    t.string   "hits"
    t.string   "doubles"
    t.string   "triples"
    t.string   "rbi"
    t.string   "steals"
    t.string   "caught_stealing"
    t.string   "sacrifice_hits"
    t.string   "sacrifice_flies"
    t.string   "num_errors"
    t.string   "pb"
    t.string   "walks"
    t.string   "struck_out"
    t.string   "hit_by_pitch"
    t.string   "wild_pitches"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "seasons", :force => true do |t|
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "division_id"
    t.string   "name"
    t.string   "city"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
