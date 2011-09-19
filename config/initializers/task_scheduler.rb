require 'rufus/scheduler'
scheduler = Rufus::Scheduler.start_new

scheduler.cron '59 23 * * 0' do
  User.all.each { |user| user.convert_activities_to_stars }
end
