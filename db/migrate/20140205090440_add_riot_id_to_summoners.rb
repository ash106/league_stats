class AddRiotIdToSummoners < ActiveRecord::Migration
  def change
    add_column :summoners, :riot_id, :integer
  end
end
