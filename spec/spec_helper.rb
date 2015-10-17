ENV['RAILS_ENV'] ||= 'test'

if ENV['APPRAISAL_INITIALIZED'] || ENV['TRAVIS']
  app_name = Pathname.new(ENV['BUNDLE_GEMFILE']).basename.to_s.gsub(/\.gemfile\z/, '')
  require File.join(File.dirname(__FILE__), 'apps', app_name, 'config', 'environment')
end

require 'rspec/rails'
require 'capybara/webkit'

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_examples = false
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
end

# Use and setup webkit as default javascript driver
# See more on https://github.com/thoughtbot/capybara-webkit#usage
Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.debug = ENV['DEBUG']
  config.timeout = 30
  config.block_unknown_urls
  config.ignore_ssl_errors
end