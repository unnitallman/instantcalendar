require 'fileutils'

namespace :instant_calendar do
  desc "Set up the plugin InstantCalendar for rails < 2.0"
  task :setup_old => :environment do
    InstantCalendar::SetupTasks.do_setup(:old)
  end
  
  desc "Set up the plugin InstantCalendar for rails >= 2.0"
  task :setup => :environment do
    InstantCalendar::SetupTasks.do_setup
  end
end
