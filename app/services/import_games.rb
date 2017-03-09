require 'pp'
class ImportGames
  def self.call
    query = {
      "team_id" => "nba-mia",
      "since" => "2 days ago"
    }

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token token=a2f3aac7b9707c5243dfe162ba2e2378",
      "Accept" => "application/vnd.stattleship.com; version=1"
    }

    games_url = "https://api.stattleship.com/basketball/nba/game_logs"
    response =  HTTParty.get(games_url , query: query, headers: headers)
    # pp response["games"].each {|game| p game["name"]}
    response["games"].map { |game|
      Game.find_or_create_by(
        # home_team_id: Team.find_by(stattle_id: game["home_team_id"]),
        # away_team_id: Team.find_by(stattle_id: game["away_team_id"]),
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
    }

    #  "attendance"=>19600,
    #  "away_team_outcome"=>"loss",
    #  "away_team_score"=>101,
    #  "duration"=>7800,
    #  "ended_at"=>"2017-03-08T21:40:00-05:00",
    #  "home_team_outcome"=>"win",
    #  "home_team_score"=>108,
    #  "interval_type"=>"regularseason",
    #  "name"=>"Hornets vs Heat March  8, 2017 at  7:30pm",
    #  "score"=>"101-108",
    #  "slug"=>"nba-2016-2017-cha-mia-2017-03-8-1930",
    #  "started_at"=>"2017-03-08T19:30:00-05:00",
    #  "title"=>"Hornets vs H
  end


    #get games where date played is yesterday
end

# "id"=>"778c1463-ce72-49b3-8c24-0ec2b69e8aee",
#  "attendance"=>19600,
#  "away_team_outcome"=>"loss",
#  "away_team_score"=>101,
#  "duration"=>7800,
#  "ended_at"=>"2017-03-08T21:40:00-05:00",
#  "home_team_outcome"=>"win",
#  "home_team_score"=>108,
#  "interval_type"=>"regularseason",
#  "name"=>"Hornets vs Heat March  8, 2017 at  7:30pm",
#  "score"=>"101-108",
#  "slug"=>"nba-2016-2017-cha-mia-2017-03-8-1930",
#  "started_at"=>"2017-03-08T19:30:00-05:00",
#  "title"=>"Hornets vs Heat",

#  "official_ids"=>
#   ["808dc418-0de1-4960-bd17-6b654ee93c45",
#    "576f93e4-88d5-4a58-9438-8e850aaa8dfa",
#    "94ed98d0-d118-4f8c-a03e-e5a8264a621e"]}
