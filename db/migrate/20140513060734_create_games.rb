class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :played
      t.string :home_team
      t.string :away_team
      t.integer :home_goals
      t.integer :away_goals
      t.integer :neutral_field

      t.timestamps
    end
  end
end
