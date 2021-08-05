require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 6.1

    config.active_record.schema_format = :sql

    config.i18n.available_locales = [:ru]
    config.i18n.default_locale = :ru

    config.hosts << ENV.fetch("HOST")
    # Does not work with web part of application. Address this issue later
    # config.action_dispatch.cookies_same_site_protection = :none
    config.session_store :cookie_store, key: "_app_session"#, secure: true

    config.action_view.field_error_proc = Proc.new do |html_tag, _instance|
      html_tag.html_safe
    end
  end
end
