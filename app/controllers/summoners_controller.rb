class SummonersController < ApplicationController
  before_action :set_summoner, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /summoners
  # GET /summoners.json
  def index
    @summoners = Summoner.all
  end

  # GET /summoners/1
  # GET /summoners/1.json
  def show
  end

  # GET /summoners/new
  def new
    @summoner = Summoner.new
  end

  # GET /summoners/1/edit
  def edit
  end

  # POST /summoners
  # POST /summoners.json
  def create
    @user = current_user
    @summoner = @user.summoners.create(summoner_params)

    respond_to do |format|
      if @summoner.save
        format.html { redirect_to @summoner, notice: 'Summoner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @summoner }
      else
        format.html { render action: 'new' }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summoners/1
  # PATCH/PUT /summoners/1.json
  def update
    respond_to do |format|
      if @summoner.update(summoner_params)
        format.html { redirect_to @summoner, notice: 'Summoner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

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
      @summoner = Summoner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summoner_params
      params.require(:summoner).permit(:name, :level, :icon, :server, :honor_friendly, :honor_helpful, :honor_teamwork, :honor_opponent, :lifetime_ip, :last_season)
    end
end
