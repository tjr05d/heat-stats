class ImportGame
  def self.call(team="nba-mia", interval="5 days ago")
    query = {
      "team_id" => team,
      "since" => interval
    }

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token token=a2f3aac7b9707c5243dfe162ba2e2378",
      "Accept" => "application/vnd.stattleship.com; version=1"
    }

    games_url = "https://api.stattleship.com/basketball/nba/game_logs"
    response =  HTTParty.get(games_url , query: query, headers: headers)

    response["games"].each { |game|
      existing_game = Game.find_by(slug: game["slug"])
      unless existing_game
      new_game = Game.create!(
          home_team_id: Team.find_by(stattle_id: game["home_team_id"]).id,
          away_team_id: Team.find_by(stattle_id: game["away_team_id"]).id,
          home_team_score: game["home_team_score"].to_i,
          away_team_score: game["away_team_score"].to_i,
          start_time: game["started_at"],
          end_time: game["ended_at"],
          duration: game["duration"].to_i,
          attendance: game["attendance"].to_i,
          slug: game["slug"],
          interval_type: game["interval_type"],
          title: game["title"]
          )
          puts "*" * 50
          puts "New Game Record: #{new_game.home_team} vs. #{new_game.away_team} has been created "
          puts "*" * 50
      end
    }
  end
end
#  "official_ids"=>
#   ["808dc418-0de1-4960-bd17-6b654ee93c45",
#    "576f93e4-88d5-4a58-9438-8e850aaa8dfa",
#    "94ed98d0-d118-4f8c-a03e-e5a8264a621e"]}
