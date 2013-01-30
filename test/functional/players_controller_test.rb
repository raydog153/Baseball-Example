require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { balk: @player.balk, earned_runs: @player.earned_runs, era: @player.era, first_name: @player.first_name, games: @player.games, games_complete: @player.games_complete, games_started: @player.games_started, hit_batter: @player.hit_batter, home_runs: @player.home_runs, innings: @player.innings, last_name: @player.last_name, losses: @player.losses, position: @player.position, runs: @player.runs, saves: @player.saves, shut_outs: @player.shut_outs, struck_out_batter: @player.struck_out_batter, team_id: @player.team_id, throws: @player.throws, walked_batter: @player.walked_batter, wild_pitchers: @player.wild_pitchers, wins: @player.wins }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    put :update, id: @player, player: { balk: @player.balk, earned_runs: @player.earned_runs, era: @player.era, first_name: @player.first_name, games: @player.games, games_complete: @player.games_complete, games_started: @player.games_started, hit_batter: @player.hit_batter, home_runs: @player.home_runs, innings: @player.innings, last_name: @player.last_name, losses: @player.losses, position: @player.position, runs: @player.runs, saves: @player.saves, shut_outs: @player.shut_outs, struck_out_batter: @player.struck_out_batter, team_id: @player.team_id, throws: @player.throws, walked_batter: @player.walked_batter, wild_pitchers: @player.wild_pitchers, wins: @player.wins }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
