class Team < ApplicationRecord
  has_many :home_games, foreign_key: :home_team_id, class_name: 'Game'
  has_many :away_games, foreign_key: :away_team_id, class_name: 'Game'
  has_many :players

  def to_s
    "#{city} #{nickname}"
  end

  def games
    home_games + away_games
  end
end
