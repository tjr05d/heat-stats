class Game < ApplicationRecord
  belongs_to :home_team
  belongs_to :away_team
end
