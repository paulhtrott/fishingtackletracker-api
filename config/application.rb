require_relative 'boot'

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fishingtackletracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = "Central Time (US & Canada)"
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.generators do |g|
      g.test_framework :minitest, spec: true, fixture: false
    end

    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
