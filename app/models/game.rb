class Game < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  def final_score
    "#{home_team}: #{home_team_score} #{away_team}: #{away_team_score}"
  end

  def duration_in_hours
    Time.at(duration).utc.strftime("%H:%M:%S")
  end
end
