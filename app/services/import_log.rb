require 'pp'
class ImportLog
  def self.call(game_slug="nba-2016-2017-mia-cle-2017-03-6-1900")
    query = {
      "per_page" => 100,
      "quarter" => 2,
      "event_type" => "twopointmade"
    }
    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token token=a2f3aac7b9707c5243dfe162ba2e2378",
      "Accept" => "application/vnd.stattleship.com; version=1"
    }

    pbp_base_url = "https://api.stattleship.com/basketball/nba/play_by_play/"
    response =  HTTParty.get(pbp_base_url + game_slug, query: query, headers: headers)

    # pp response["play_by_play"].each do | play |
  end
end
