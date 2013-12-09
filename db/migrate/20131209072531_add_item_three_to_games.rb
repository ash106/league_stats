class AddItemThreeToGames < ActiveRecord::Migration
  def change
    add_column :games, :item_three, :integer
  end
end
