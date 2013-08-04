require File.expand_path('../boot', __FILE__)
require 'carrierwave'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Medium
  class Application < Rails::Application
  ActionDispatch::Callbacks.after do
    # Reload the factories
      return unless (Rails.env.development? || Rails.env.test?)

        unless FactoryGirl.factories.blank? # first init will load factories, this should only run on subsequent reloads
            FactoryGirl.factories.clear
                FactoryGirl.find_definitions
                  end
                  end
  end
end
