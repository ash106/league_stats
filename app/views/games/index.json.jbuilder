json.array!(@games) do |game|
  json.extract! game, :id, :summoner_id, :game_num, :ip_earned, :ping, :time_in_queue, :champion_id, :queue_type, :create_date, :spell_one, :spell_two, :team_id, :neutral_minions_killed_enemy_jungle, :true_damage_dealt_to_champions, :total_heal, :ward_placed, :assists, :total_damage_dealt_to_champions, :true_damage_taken, :num_deaths, :largest_killing_spree, :magic_damage_dealt_player, :true_damage_dealt_player, :item_four, :physical_damage_dealt_player, :largest_multi_kill, :item_two, :neutral_minions_killed_your_jungle, :physical_damage_taken, :total_damage_taken, :minions_killed, :champions_killed, :item_one, :magic_damage_taken, :physical_damage_dealt_to_champions, :item_five, :gold_earned, :magic_damage_dealt_to_champions, :item_six, :total_time_spent_dead, :neutral_minions_killed, :level, :item_zero, :total_damage_dealt, :sight_wards_bought_in_game, :total_time_crowd_control_dealt, :win
  json.url game_url(game, format: :json)
end
