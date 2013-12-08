class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :summoner, index: true
      t.integer :game_num
      t.integer :ip_earned
      t.integer :ping
      t.integer :time_in_queue
      t.integer :champion_id
      t.string :queue_type
      t.datetime :create_date
      t.integer :spell_one
      t.integer :spell_two
      t.integer :team_id
      t.integer :neutral_minions_killed_enemy_jungle
      t.integer :true_damage_dealt_to_champions
      t.integer :total_heal
      t.integer :ward_placed
      t.integer :assists
      t.integer :total_damage_dealt_to_champions
      t.integer :true_damage_taken
      t.integer :num_deaths
      t.integer :largest_killing_spree
      t.integer :magic_damage_dealt_player
      t.integer :true_damage_dealt_player
      t.integer :item_four
      t.integer :physical_damage_dealt_player
      t.integer :largest_multi_kill
      t.integer :item_two
      t.integer :neutral_minions_killed_your_jungle
      t.integer :physical_damage_taken
      t.integer :total_damage_taken
      t.integer :minions_killed
      t.integer :champions_killed
      t.integer :item_one
      t.integer :magic_damage_taken
      t.integer :physical_damage_dealt_to_champions
      t.integer :item_five
      t.integer :gold_earned
      t.integer :magic_damage_dealt_to_champions
      t.integer :item_six
      t.integer :total_time_spent_dead
      t.integer :neutral_minions_killed
      t.integer :level
      t.integer :item_zero
      t.integer :total_damage_dealt
      t.integer :sight_wards_bought_in_game
      t.integer :total_time_crowd_control_dealt
      t.boolean :win

      t.timestamps
    end
  end
end
