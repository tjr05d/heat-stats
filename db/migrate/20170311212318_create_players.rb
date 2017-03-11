class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :stattle_id
      t.boolean :active
      t.string :birth_date
      t.string :city
      t.string :country
      t.integer :draft_overall_pick
      t.integer :draft_round
      t.string :draft_season
      t.string :draft_team_name
      t.string :first_name
      t.string :handedness
      t.string :height
      t.string :high_school
      t.string :humanized_salary
      t.string :last_name
      t.string :nickname
      t.string :position_abbreviation
      t.string :school
      t.string :slug
      t.string :state
      t.string :uniform_number
      t.string :weight
      t.string :years_of_experience
      t.belongs_to :team, foreign_key: true
      t.timestamps
    end
  end
end
