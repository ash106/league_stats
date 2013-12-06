class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.integer :level
      t.integer :icon
      t.string :server
      t.integer :honor_friendly
      t.integer :honor_helpful
      t.integer :honor_teamwork
      t.integer :honor_opponent
      t.integer :lifetime_ip
      t.string :last_season

      t.timestamps
    end
  end
end
