require 'pp'
class ImportRoster
  def self.call(team='nba-mia')
    query = {
      "team_id" => team
    }

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token token=a2f3aac7b9707c5243dfe162ba2e2378",
      "Accept" => "application/vnd.stattleship.com; version=1"
    }

    base_url = "https://api.stattleship.com/basketball/nba/rosters"
    response =  HTTParty.get(base_url, query: query, headers: headers)

    response["players"].each do | player |
      #get the team that the player is currently on
      current_team = Team.find_by(stattle_id: player["team_id"])
      #check to see if the player is an existing player
      existing_player = Player.find_by(stattle_id: player["id"])
      #if the player does not yet exist, create a new record
      unless existing_player
        new_player = Player.create!(
          stattle_id: player["id"],
          active: player["active"],
          birth_date: player["birth_date"],
          city: player["city"],
          country: player["country"],
          draft_overall_pick: player["draft_overall_pick"],
          draft_round: player["draft_round"],
          draft_season: player["draft_season"],
          draft_team_name: player["draft_team_name"],
          first_name: player["first_name"],
          handedness: player["handedness"],
          height: player["height"],
          high_school: player["high_school"],
          humanized_salary: player["humanized_salary"],
          last_name: player["last_name"],
          nickname: player["nickname"],
          position_abbreviation: player["position_abbreviation"],
          school: player["school"],
          slug: player["slug"],
          state: player["state"],
          uniform_number: player["uniform_number"],
          weight: player["weight"],
          years_of_experience: player["years_of_experience"],
          team: current_team
        )
        puts "*" * 50
        puts "Update to the #{current_team.city} #{current_team.nickname}"
        puts "*" * 50
        puts "New Player: #{new_player.first_name} #{new_player.last_name} has been created "
      end
    end
  end
end
