class Summoner < ActiveRecord::Base
  has_many :ownerships
  has_many :users, through: :ownerships
  validates :level, presence: true
end
