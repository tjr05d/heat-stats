namespace :games do
  desc "creates records for games since the last available record for the MIA HEAT"
  task :import_new => :environment do
    ImportGames.call
 end

 desc "gets retrieves the play by play logs for the newest MIA HEAT games"
 task :import_pbp => :environment do
 end
end
