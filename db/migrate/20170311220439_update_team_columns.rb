class UpdateTeamColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :color, :string
    add_column :teams, :colors, :string
    add_column :teams, :hashtag, :string
    add_column :teams, :latitude, :string
    add_column :teams, :longitude, :string
    add_column :teams, :slug, :string
    add_column :teams, :division_id, :string
  end
end
