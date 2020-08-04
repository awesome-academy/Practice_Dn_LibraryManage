<<<<<<< HEAD
# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
=======
require_relative "boot"

require "rails/all"
>>>>>>> 0279bce42717a994b51c4c1880b8762ec6396282

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Library
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
<<<<<<< HEAD
    config.i18n.available_locales = %i[en vi]
=======
    config.i18n.available_locales = [:en, :vi]
>>>>>>> 0279bce42717a994b51c4c1880b8762ec6396282
  end
end
