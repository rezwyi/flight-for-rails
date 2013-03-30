require File.expand_path('../lib/flight-for-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'flight-for-rails'
  s.summary = 'Flight javascript framework for Rails 3.1 and greater assets pipeline'
  s.description = s.summary

  s.version  = FlightForRails::VERSION
  s.platform  = Gem::Platform::RUBY
  
  s.authors = ['Sergey Rezvanov']
  s.email = ['sergey@rezvanov.info']

  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 3.1.0'
  s.add_dependency 'jquery-rails'
end
