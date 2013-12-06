json.array!(@summoners) do |summoner|
  json.extract! summoner, :id, :name, :level, :icon, :server, :honor_friendly, :honor_helpful, :honor_teamwork, :honor_opponent, :lifetime_ip, :last_season
  json.url summoner_url(summoner, format: :json)
end
