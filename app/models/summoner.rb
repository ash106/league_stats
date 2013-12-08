class Summoner < ActiveRecord::Base
  has_many :ownerships
  has_many :users, through: :ownerships
  has_many :games
  validates :level, presence: true
end
