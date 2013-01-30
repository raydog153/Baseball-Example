# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

data_file = File.open("#{Rails.root}/db/1998statistics.xml",'r')
doc = Nokogiri::XML(data_file)
data_file.close
data = Hash.from_xml(doc.to_s)
#p data
data.each do |k,season|
  #Create season
  season_entry = Season.create(year: season["YEAR"])
  season["LEAGUE"].each do |league|
    league_entry = League.create(season_id: season_entry.id, name: league["LEAGUE_NAME"])
    league["DIVISION"].each do |division|
      division_entry = Division.create(league_id: league_entry.id, name: division["DIVISION_NAME"])
      division["TEAM"].each do |team|
        team_entry = Team.create(division_id: division_entry.id, name: team["TEAM_NAME"], city: team["TEAM_CITY"])
        team["PLAYER"].each do |player|
          attr = {team_id: team_entry.id, num_errors: player.delete("ERRORS")}
          player.each do |k,v|
            attr[k.downcase.to_sym] = v
          end

          Player.create(attr)
        end
      end
    end
  end
end