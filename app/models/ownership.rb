class Ownership < ActiveRecord::Base
  belongs_to :user
  belongs_to :summoner
  validates :summoner_id, uniqueness: { scope: :user_id }
end
