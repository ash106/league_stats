class SummonersController < ApplicationController
  before_action :set_summoner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_unirest_header

  # GET /summoners
  # GET /summoners.json
  def index
    @summoners = Summoner.all
  end

  # GET /summoners/1
  # GET /summoners/1.json
  def show
    @game = @summoner.games.new
    @games = @summoner.games.order(game_num: :desc)
  end

  # GET /summoners/new
  def new
    @summoner = current_user.summoners.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end

  # GET /summoners/1/edit
  # def edit
  # end

  # POST /summoners
  # POST /summoners.json
  def create
    @user = current_user
    # @summoner = Summoner.new(summoner_params)
    @summoners = current_user.summoners.order(updated_at: :desc)

    server = params[:summoner][:server].downcase
    name = params[:summoner][:name].downcase

    @summoner = Summoner.where(server: server, name: name).first_or_initialize

    if Ownership.where(summoner_id: @summoner.id, user_id: current_user.id).empty?
      search_string = "https://teemojson.p.mashape.com/player/#{server}/#{name}"
      response = Unirest.get(search_string).body["data"]

      if response.present?
        @summoner.icon = response["icon"]
        @summoner.level = response["level"]
      end

      search_string = "https://teemojson.p.mashape.com/player/#{server}/#{name}/honor"
      response = Unirest.get(search_string).body["data"]

      if response.present?
        @summoner.honor_friendly = response["totals"][1]
        @summoner.honor_helpful = response["totals"][2]
        @summoner.honor_teamwork = response["totals"][3]
        @summoner.honor_opponent = response["totals"][4]
      end

      search_string = "https://teemojson.p.mashape.com/player/#{server}/#{name}/influence_points"
      response = Unirest.get(search_string).body["data"]

      if response.present?
        @summoner.lifetime_ip = response
      end

      search_string = "https://teemojson.p.mashape.com/player/#{server}/#{name}/past_seasons"
      response = Unirest.get(search_string).body["data"]

      if response.present?
        @summoner.last_season = response["seasonTwo"]
      end

      respond_to do |format|
        if @summoner.save
          @user.summoners << @summoner
          format.html { redirect_to summoner_path(@summoner.server, @summoner.name), notice: 'Summoner was successfully created.' }
          format.json { render action: 'show', status: :created, location: @summoner }
          format.js
          return
        else
          format.html { render action: 'new' }
          format.json { render json: @summoner.errors, status: :unprocessable_entity }
          format.js
          return
        end
      end
    end

    @summoner = Summoner.new

    respond_to do |format|
      format.html { redirect_to summoner_path(@summoner.server, @summoner.name), notice: 'Summoner was successfully created.' }
      format.json { render action: 'show', status: :created, location: @summoner }
      format.js
      return
    end
  end

  # PATCH/PUT /summoners/1
  # PATCH/PUT /summoners/1.json
  # def update
  #   respond_to do |format|
  #     if @summoner.update(summoner_params)
  #       format.html { redirect_to @summoner, notice: 'Summoner was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @summoner.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /summoners/1
  # DELETE /summoners/1.json
  def destroy
    @summoner.destroy
    respond_to do |format|
      format.html { redirect_to summoners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summoner
      @summoner = Summoner.where(:name=>params[:name]).where(:server=>params[:server]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summoner_params
      params.require(:summoner).permit(:name, :level, :icon, :server, :honor_friendly, :honor_helpful, :honor_teamwork, :honor_opponent, :lifetime_ip, :last_season)
    end

    def set_unirest_header
      Unirest.default_header("X-Mashape-Authorization",ENV['MASHAPE_KEY'])
    end
end
