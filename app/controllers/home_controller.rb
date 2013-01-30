class HomeController < ApplicationController
  # GET /leagues
  # GET /leagues.json
  def home
    @seasons = Season.all
    @players = Player.where("at_bats > 0").all
  end

end