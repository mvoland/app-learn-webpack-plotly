require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Locales
    config.i18n.available_locales %i[fr]
    config.i18n.default_locale = :fr

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # IONOS SMTP settings
    config.action_mailer.smtp_settings = {
      address: 'auth.smtp.1and1.co.uk',
      port: 587,
      domain: 'happy-minute.com',
      user_name: ENV['IONOS_SMTP_USERNAME'],
      password: ENV['IONOS_SMTP_PASSWORD'],
      authentication: 'login'
    }

    # Timezone
    config.time_zone = 'Europe/Paris'
  end
end
