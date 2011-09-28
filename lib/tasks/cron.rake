desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  if Time.now.saturday? # run at midnight
    User.convert_activities_to_stars
  end
end
