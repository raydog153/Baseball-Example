class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :team_id
      t.string :surname
      t.string :given_name
      t.string :throws
      t.string :position
      t.string :wins
      t.string :losses
      t.string :saves
      t.string :games
      t.string :games_started
      t.string :complete_games
      t.string :shut_outs
      t.string :era
      t.string :innings
      t.string :home_runs
      t.string :runs
      t.string :earned_runs
      t.string :hit_batter
      t.string :wild_pitchers
      t.string :balk
      t.string :walked_batter
      t.string :struck_out_batter
      t.string :at_bats
      t.string :hits
      t.string :doubles
      t.string :triples
      t.string :rbi
      t.string :steals
      t.string :caught_stealing
      t.string :sacrifice_hits
      t.string :sacrifice_flies
      t.string :num_errors
      t.string :pb
      t.string :walks
      t.string :struck_out
      t.string :hit_by_pitch
      t.string :wild_pitches

      t.timestamps
    end
  end
end
