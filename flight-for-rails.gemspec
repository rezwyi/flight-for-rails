require File.expand_path('../lib/flight-for-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'flight-for-rails'
  s.summary = 'Flight javascript framework for Rails assets pipeline'
  s.description = s.summary

  s.version  = FlightForRails::VERSION
  s.platform  = Gem::Platform::RUBY

  s.authors = ['Sergey Rezvanov']
  s.email = ['sergey@rezvanov.info']
  s.homepage = 'https://github.com/rezwyi/flight-for-rails'

  s.licenses = ['MIT']

  s.files = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'rails', '>= 3.1.0'
  s.add_dependency 'jquery-rails', '>= 2.1.4'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'capybara-webkit'
end
