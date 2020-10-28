require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PuzzledpintCom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.active_record.time_zone_aware_types = [:datetime, :time]

    config.to_prepare do
      # Only Applications list
      Doorkeeper::ApplicationsController.layout "game_control"

      # Only Authorization endpoint
      Doorkeeper::AuthorizationsController.layout "game_control"

      # Only Authorized Applications
      Doorkeeper::AuthorizedApplicationsController.layout "game_control"
    end
  end
end
