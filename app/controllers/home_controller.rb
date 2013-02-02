class HomeController < ApplicationController
  # GET /leagues
  # GET /leagues.json
  def home
    LoadDataFile::load_xml_file("1998statistics.xml") if Rails.env == "development"

    @seasons = Rails.cache.read(:seasons)
    @players = Rails.cache.read(:players).reject do |player| (player.at_bats.nil? || player.at_bats.to_i < 1) end
  end

end