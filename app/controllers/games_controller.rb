class GamesController < ApplicationController
  before_action :set_game, only: [:show, :destroy]
  before_action :set_summoner, only: :create
  before_action :set_unirest_header

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  # def edit
  # end

  # POST /games
  # POST /games.json
  def create
    server = params[:server]
    name = params[:name]

    search_string = "https://teemojson.p.mashape.com/player/#{server}/#{name}/recent_games"
    response = Unirest.get(search_string).body["data"]

    sorted_game_nums = response["playerGameStatsMap"].keys.sort_by(&:to_i)
    game_stats = response["gameStatistics"]["array"]

    saved_games = []
    discarded_games = []

    if response.present?
      for num in sorted_game_nums
        for game in game_stats
          if num.to_i == game["gameId"] && (game["queueType"] == "RANKED_SOLO_5x5" || game["queueType"] == "NORMAL")
            @game = Game.where(game_num: game["gameId"], summoner_id: params[:game][:summoner_id]).first_or_initialize
            @game.game_num = game["gameId"]
            @game.ip_earned = game["ipEarned"]
            @game.ping = game["userServerPing"]
            @game.time_in_queue = game["timeInQueue"]
            @game.champion_id = game["championId"]
            @game.queue_type = game["queueType"]
            @game.spell_one = game["spell1"]
            @game.spell_two = game["spell2"]
            @game.team_id = game["teamId"]

            stats = game["statistics"]["array"]

            for stat in stats
              case stat["statType"]
              when "WIN" then @game.win = true
              when "LOSE" then @game.win = false
              when "ITEM0" then @game.item_zero = stat["value"]
              when "ITEM1" then @game.item_one = stat["value"]
              when "ITEM2" then @game.item_two = stat["value"]
              when "ITEM3" then @game.item_three = stat["value"]
              when "ITEM4" then @game.item_four = stat["value"]
              when "ITEM5" then @game.item_five = stat["value"]
              when "ITEM6" then @game.item_six = stat["value"]
              when "CHAMPIONS_KILLED" then @game.champions_killed = stat["value"]
              when "NUM_DEATHS" then @game.num_deaths = stat["value"]
              when "ASSISTS" then @game.assists = stat["value"]
              when "GOLD_EARNED" then @game.gold_earned = stat["value"]
              when "LEVEL" then @game.level = stat["value"]
              when "MINIONS_KILLED" then @game.minions_killed = stat["value"]
              when "NEUTRAL_MINIONS_KILLED" then @game.neutral_minions_killed = stat["value"]
              when "NEUTRAL_MINIONS_KILLED_YOUR_JUNGLE" then @game.neutral_minions_killed_your_jungle = stat["value"]
              when "NEUTRAL_MINIONS_KILLED_ENEMY_JUNGLE" then @game.neutral_minions_killed_enemy_jungle = stat["value"]              
              when "LARGEST_MULTI_KILL" then @game.largest_multi_kill = stat["value"]
              when "LARGEST_KILLING_SPREE" then @game.largest_killing_spree = stat["value"]
              when "TOTAL_DAMAGE_DEALT" then @game.total_damage_dealt = stat["value"]
              when "TRUE_DAMAGE_DEALT_PLAYER" then @game.true_damage_dealt_player = stat["value"]
              when "MAGIC_DAMAGE_DEALT_PLAYER" then @game.magic_damage_dealt_player = stat["value"]
              when "PHYSICAL_DAMAGE_DEALT_PLAYER" then @game.physical_damage_dealt_player = stat["value"]
              when "TOTAL_DAMAGE_DEALT_TO_CHAMPIONS" then @game.total_damage_dealt_to_champions = stat["value"]
              when "TRUE_DAMAGE_DEALT_TO_CHAMPIONS" then @game.true_damage_dealt_to_champions = stat["value"]
              when "MAGIC_DAMAGE_DEALT_TO_CHAMPIONS" then @game.magic_damage_dealt_to_champions = stat["value"]
              when "PHYSICAL_DAMAGE_DEALT_TO_CHAMPIONS" then @game.physical_damage_dealt_to_champions = stat["value"]
              when "TOTAL_DAMAGE_TAKEN" then @game.total_damage_taken = stat["value"]
              when "TRUE_DAMAGE_TAKEN" then @game.true_damage_taken = stat["value"]
              when "MAGIC_DAMAGE_TAKEN" then @game.magic_damage_taken = stat["value"]
              when "PHYSICAL_DAMAGE_TAKEN" then @game.physical_damage_taken = stat["value"]
              when "TOTAL_HEAL" then @game.total_heal = stat["value"]
              when "TOTAL_TIME_CROWD_CONTROL_DEALT" then @game.total_time_crowd_control_dealt = stat["value"]
              when "TOTAL_TIME_SPENT_DEAD" then @game.total_time_spent_dead = stat["value"]
              when "WARD_PLACED" then @game.ward_placed = stat["value"]
              when "SIGHT_WARDS_BOUGHT_IN_GAME" then @game.sight_wards_bought_in_game = stat["value"]
              end
            end
            if @game.save
              saved_games.push(num)
            else
              discarded_games.push(num)
            end
          end
        end
      end
    end

    @games = Game.where(summoner_id: params[:game][:summoner_id])

    respond_to do |format|
      # if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
        format.js
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @game.errors, status: :unprocessable_entity }
      #   format.js
      # end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  # def update
  #   respond_to do |format|
  #     if @game.update(game_params)
  #       format.html { redirect_to @game, notice: 'Game was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @game.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @summoner = Summoner.where(:name=>params[:name]).where(:server=>params[:server]).first
      @game = @summoner.games.where(:game_num=>params[:game_num]).first
    end

    def set_summoner
      @summoner = Summoner.where(:name=>params[:name]).where(:server=>params[:server]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:summoner_id, :game_num, :ip_earned, :ping, :time_in_queue, :champion_id, :queue_type, :create_date, :spell_one, :spell_two, :team_id, :neutral_minions_killed_enemy_jungle, :true_damage_dealt_to_champions, :total_heal, :ward_placed, :assists, :total_damage_dealt_to_champions, :true_damage_taken, :num_deaths, :largest_killing_spree, :magic_damage_dealt_player, :true_damage_dealt_player, :item_four, :physical_damage_dealt_player, :largest_multi_kill, :item_two, :neutral_minions_killed_your_jungle, :physical_damage_taken, :total_damage_taken, :minions_killed, :champions_killed, :item_one, :magic_damage_taken, :physical_damage_dealt_to_champions, :item_five, :gold_earned, :magic_damage_dealt_to_champions, :item_six, :total_time_spent_dead, :neutral_minions_killed, :level, :item_zero, :total_damage_dealt, :sight_wards_bought_in_game, :total_time_crowd_control_dealt, :win)
    end

    def set_unirest_header
      Unirest.default_header("X-Mashape-Authorization",ENV['MASHAPE_KEY'])
    end
end
