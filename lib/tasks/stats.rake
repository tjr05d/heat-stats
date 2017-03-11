namespace :games do
  desc "creates records for games since the last available record for the MIA HEAT"
  task :import_new => :environment do
    ImportGame.call
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
 task :import_team => :environment do
   ImportTeam.call
 end
end
