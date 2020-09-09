require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone = 'Warsaw'

    I18n.enforce_available_locales = true

    # setup available locales
    I18n.config.available_locales = %i[en ru]

    # setup default locale
    I18n.default_locale = :en
    config_autoloader = :classic

    # included directories aren't included (only in clietns dir)
    config.autoload_paths << "#{Rails.root}/lib/clients"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
