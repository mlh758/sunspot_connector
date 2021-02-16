# frozen_string_literal: true
require 'rails/railtie'

module SunspotConnector

  class Railtie < ::Rails::Railtie
    config.solr_connection_overrides = nil
    initializer 'override_solr_connection' do |app|
      Sunspot::Session.connection_class = SunspotConnector::Connection.new(app.config.solr_connection_overrides)
    end
  end
end