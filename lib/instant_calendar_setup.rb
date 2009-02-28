require 'fileutils'

module InstantCalendar #:nodoc
  module SetupTasks #:nodoc

    def self.do_setup(version = :new)
      @version = version

      begin
        copy_view_file
        puts "Restart your application"
      rescue StandardError => e
        p e
      end
    end

    private

    def self.copy_view_file
      puts "Copying InstantCalendar view file."
      mkdir(File.join(RAILS_ROOT, "app/views/instant_calendar")) unless File.exist?(File.join(RAILS_ROOT, "app/views/instant_calendar"))
      view_file = @version == :old ? '_calendar.rhtml' : '_calendar.erb'
      FileUtils.cp_r(
        File.join(File.dirname(__FILE__), "../assets/views/instant_calendar/_calendar.erb"),
        File.join(RAILS_ROOT, "app/views/instant_calendar/", view_file)
      )
      
			FileUtils.cp_r(
        File.join(File.dirname(__FILE__), "../assets/stylesheets/calendar.css"),
        File.join(RAILS_ROOT, "public/stylesheets/calendar.css")
      )
      puts "================================DONE==========================================="
    end
  end
end
