$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'rubygems'
require 'bundler/setup'
require 'open-uri'
require 'erb'
require 'rspec/core/rake_task'
require 'flight-for-rails/version'

Bundler::GemHelper.install_tasks

if !ENV['APPRAISAL_INITIALIZED'] && !ENV['TRAVIS']
  require 'appraisal'
  task default: :appraisal
else
  RSpec::Core::RakeTask.new do |spec|
    spec.pattern = 'spec/**/*_spec.rb'
  end
  task default: :spec
end

namespace :flight do
  desc 'Try to update standalone version of flight.js'
  task :check_for_updates do
    project_root = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__))))
    source_file = open('http://flightjs.github.io/release/latest/flight.js')

    if source_file && (fl = source_file.gets)
      fl.match /\A\/\*! *Flight *v([0-9]*\.[0-9]*\.[0-9]*)/
      if $1 && (version = $1) != FlightForRails::VERSION
        source_file.rewind

        # Updates vendor/assets/javascripts/flight/standalone.js
        open(project_root.join('vendor', 'assets', 'javascripts', 'flight', 'standalone.js'), 'w') do |file|
          file.write source_file.read
        end

        # Updates lib/flight-for-rails/version.rb
        erb = ERB.new(open(project_root.join('templates', 'version.erb'), 'r').read)
        open(project_root.join('lib', 'flight-for-rails', 'version.rb'), 'w') do |file|
          file.write erb.result(binding)
        end

        # Updates installation version in README file
        erb = ERB.new(open(project_root.join('templates', 'readme.erb'), 'r').read)
        open(project_root.join('README.md'), 'w') do |file|
          file.write erb.result(binding)
        end

        puts "Hooray! Flight.js has been updated to v#{$1}!"
      else
        puts 'Already up-to-date.'
      end
    end
  end
end
