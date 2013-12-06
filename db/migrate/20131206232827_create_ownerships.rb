class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.references :user, index: true
      t.references :summoner, index: true
      t.boolean :is_owner

      t.timestamps
    end
  end
end
