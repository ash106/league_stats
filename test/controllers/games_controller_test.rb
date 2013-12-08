require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { assists: @game.assists, champion_id: @game.champion_id, champions_killed: @game.champions_killed, create_date: @game.create_date, game_num: @game.game_num, gold_earned: @game.gold_earned, ip_earned: @game.ip_earned, item_five: @game.item_five, item_four: @game.item_four, item_one: @game.item_one, item_six: @game.item_six, item_two: @game.item_two, item_zero: @game.item_zero, largest_killing_spree: @game.largest_killing_spree, largest_multi_kill: @game.largest_multi_kill, level: @game.level, magic_damage_dealt_player: @game.magic_damage_dealt_player, magic_damage_dealt_to_champions: @game.magic_damage_dealt_to_champions, magic_damage_taken: @game.magic_damage_taken, minions_killed: @game.minions_killed, neutral_minions_killed: @game.neutral_minions_killed, neutral_minions_killed_enemy_jungle: @game.neutral_minions_killed_enemy_jungle, neutral_minions_killed_your_jungle: @game.neutral_minions_killed_your_jungle, num_deaths: @game.num_deaths, physical_damage_dealt_player: @game.physical_damage_dealt_player, physical_damage_dealt_to_champions: @game.physical_damage_dealt_to_champions, physical_damage_taken: @game.physical_damage_taken, ping: @game.ping, queue_type: @game.queue_type, sight_wards_bought_in_game: @game.sight_wards_bought_in_game, spell_one: @game.spell_one, spell_two: @game.spell_two, summoner_id: @game.summoner_id, team_id: @game.team_id, time_in_queue: @game.time_in_queue, total_damage_dealt: @game.total_damage_dealt, total_damage_dealt_to_champions: @game.total_damage_dealt_to_champions, total_damage_taken: @game.total_damage_taken, total_heal: @game.total_heal, total_time_crowd_control_dealt: @game.total_time_crowd_control_dealt, total_time_spent_dead: @game.total_time_spent_dead, true_damage_dealt_player: @game.true_damage_dealt_player, true_damage_dealt_to_champions: @game.true_damage_dealt_to_champions, true_damage_taken: @game.true_damage_taken, ward_placed: @game.ward_placed, win: @game.win }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { assists: @game.assists, champion_id: @game.champion_id, champions_killed: @game.champions_killed, create_date: @game.create_date, game_num: @game.game_num, gold_earned: @game.gold_earned, ip_earned: @game.ip_earned, item_five: @game.item_five, item_four: @game.item_four, item_one: @game.item_one, item_six: @game.item_six, item_two: @game.item_two, item_zero: @game.item_zero, largest_killing_spree: @game.largest_killing_spree, largest_multi_kill: @game.largest_multi_kill, level: @game.level, magic_damage_dealt_player: @game.magic_damage_dealt_player, magic_damage_dealt_to_champions: @game.magic_damage_dealt_to_champions, magic_damage_taken: @game.magic_damage_taken, minions_killed: @game.minions_killed, neutral_minions_killed: @game.neutral_minions_killed, neutral_minions_killed_enemy_jungle: @game.neutral_minions_killed_enemy_jungle, neutral_minions_killed_your_jungle: @game.neutral_minions_killed_your_jungle, num_deaths: @game.num_deaths, physical_damage_dealt_player: @game.physical_damage_dealt_player, physical_damage_dealt_to_champions: @game.physical_damage_dealt_to_champions, physical_damage_taken: @game.physical_damage_taken, ping: @game.ping, queue_type: @game.queue_type, sight_wards_bought_in_game: @game.sight_wards_bought_in_game, spell_one: @game.spell_one, spell_two: @game.spell_two, summoner_id: @game.summoner_id, team_id: @game.team_id, time_in_queue: @game.time_in_queue, total_damage_dealt: @game.total_damage_dealt, total_damage_dealt_to_champions: @game.total_damage_dealt_to_champions, total_damage_taken: @game.total_damage_taken, total_heal: @game.total_heal, total_time_crowd_control_dealt: @game.total_time_crowd_control_dealt, total_time_spent_dead: @game.total_time_spent_dead, true_damage_dealt_player: @game.true_damage_dealt_player, true_damage_dealt_to_champions: @game.true_damage_dealt_to_champions, true_damage_taken: @game.true_damage_taken, ward_placed: @game.ward_placed, win: @game.win }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
