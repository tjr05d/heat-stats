require 'pp'
class ImportTeam
  def self.call
    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token token=a2f3aac7b9707c5243dfe162ba2e2378",
      "Accept" => "application/vnd.stattleship.com; version=1"
    }

    base_url = "https://api.stattleship.com/basketball/nba/teams"
    response =  HTTParty.get(base_url, headers: headers)
    response["teams"].each do |team|
      existing_team = Team.find_by(stattle_id: team["id"])
      unless existing_team
        Team.create(
          stattle_id: team["id"],
          color: team["color"],
          colors: team["colors"],
          hashtag: team["hashtag"],
          city: team["location"],
          nickname: team["nickname"],
          latitude: team["latitude"],
          longitude: team["longitude"],
          slug: team["slug"],
          division_id: team["division_id"],
        )
      end
    end
  end
end
