class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.belongs_to :home_team, foreign_key: true
      t.belongs_to :away_team, foreign_key: true
      t.integer :home_team_score
      t.integer :away_team_score
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration
      t.integer :attendance
      t.string :slug
      t.string :interval_type
      t.string :title

      t.timestamps
    end
  end
end
