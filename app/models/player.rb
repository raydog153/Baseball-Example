class Player < ActiveRecord::Base
  attr_accessible :balk, :earned_runs, :era, :given_name, :games, :complete_games,
                  :games_started, :hit_batter, :home_runs, :innings, :surname,
                  :losses, :position, :runs, :saves, :shut_outs, :struck_out_batter, :team_id, :throws, :walked_batter, :wild_pitchers, :wins,
                  :at_bats, :hits, :doubles, :triples, :rbi, :steals, :caught_stealing, :sacrifice_hits, :sacrifice_flies, :num_errors,
                  :pb, :walks, :struck_out, :hit_by_pitch, :wild_pitches


  def ops
    #On base percentage: times reached base (H + BB + HBP) divided by at bats plus walks plus hit by pitch plus sacrifice flies (AB + BB + HBP + SF)
    obs = (hits.to_f + walks.to_f + hit_by_pitch.to_f) / (at_bats.to_f + walks.to_f + hit_by_pitch.to_f + sacrifice_flies.to_f)

    #Slugging average: total bases achieved on hits divided by at-bats
    sa = earned_runs.to_f / at_bats.to_f

    #On-base plus slugging: on-base percentage plus slugging average
    "%2.3f" % (sa + obs)
  end

  def avg
    #Batting average (also abbreviated AVG): hits divided by at bats
   "%2.3f" % (hits.to_f / at_bats.to_f)
  end

end
