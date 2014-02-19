require File.expand_path('../lib/flight-for-rails/version', __FILE__)
require 'rubygems'
require 'bundler/setup'

Bundler::GemHelper.install_tasks

namespace :flight do
  desc 'Try to update standalone version of flight.js'
  task :check_for_updates do
    source_file = open('http://flightjs.github.io/release/latest/flight.js')
    
    if source_file && (fl = source_file.gets)
      fl.match /\A\/\*! *Flight *v([0-9]*\.[0-9]*\.[0-9]*)/
      if $1 && $1 != FlightForRails::VERSION
        source_file.rewind
        
        # Updates vendor/assets/javascripts/flight/standalone.js
        open(File.expand_path('../vendor/assets/javascripts/flight/standalone.js', __FILE__), 'w') do |file|
          file.write source_file.read
        end
        
        # Updates lib/flight-for-rails/version.rb
        open(File.expand_path('../lib/flight-for-rails/version.rb', __FILE__), 'w') do |file|
          file.write "# This file is generated automatically\nmodule FlightForRails; VERSION = '#{$1}'; end"
        end

        puts "Hooray! Flight.js has been updated to v#{$1}!"
      else
        puts 'Already up-to-date.'
      end
    end
  end
end