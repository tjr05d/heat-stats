namespace :nba do
  desc "creates records for games latest games | command line args[:team_slug, :days_ago]"
  task :latest_games, [:team_slug, :days_ago] => :environment do |t, args|
    ImportGame.call(args[:team_slug], args[:days_ago].concat(" days ago"))
  end

 desc "retrieves the play by play logs for the newest MIA HEAT games"
 task :import_pbp => :environment do
   ImportLog.call
 end

 desc "retrieves a teams roster"
 task :import_roster, [:team_slug] => :environment do |t, args|
   ImportRoster.call(args[:team_slug])
 end

 desc "retrieves a teams roster"
 task :import_teams => :environment do
   ImportTeam.call
 end
end
