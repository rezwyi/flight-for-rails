require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Rails3
  class Application < Rails::Application
    I18n.enforce_available_locales = false
    
    config.encoding = 'utf-8'
    config.assets.enabled = true
    config.assets.version = '1.0'

    config.assets.paths += Dir.glob(File.join("**", "javascripts")).map do |path|
      File.expand_path path
    end
  end
end

