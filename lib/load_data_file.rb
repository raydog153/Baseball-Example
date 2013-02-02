require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

module LoadDataFile

  def self.load_xml_file name
    data_file = File.open("#{Rails.root}/db/#{name}",'r')
    doc = Nokogiri::XML(data_file)
    data_file.close

    create_models(Hash.from_xml(doc.to_s))
  end

  def self.create_models data
    leagues = []
    divisions = []
    teams = []
    players = []
    seasons = []
    data.each do |k,season|
      #Create season
      season_entry = Season.new(year: season["YEAR"], id: season["YEAR"].to_i)
      season["LEAGUE"].each_with_index do |league, lid|
        league_entry = League.new(id: lid, season_id: season_entry.id, name: league["LEAGUE_NAME"])
        league["DIVISION"].each_with_index do |division, did|
          division_entry = Division.new(id: did, league_id: league_entry.id, name: division["DIVISION_NAME"])
          division["TEAM"].each_with_index do |team, tid|
            team_entry = Team.new(id: tid, division_id: division_entry.id, name: team["TEAM_NAME"], city: team["TEAM_CITY"])
            team["PLAYER"].each_with_index do |player, pid|
              attr = {id: pid, team_id: team_entry.id, num_errors: player.delete("ERRORS")}
              player.each do |k,v|
                attr[k.downcase.to_sym] = v
              end

              players << Player.new(attr)
            end
            teams << team_entry
          end
          divisions << division_entry
        end
        leagues << league_entry
      end
      seasons << season_entry
    end
    Rails.cache.write(:players, players)
    Rails.cache.write(:teams, teams)
    Rails.cache.write(:divisions, divisions)
    Rails.cache.write(:leagues, leagues)
    Rails.cache.write(:seasons, seasons)
  end
end