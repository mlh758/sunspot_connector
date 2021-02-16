# frozen_string_literal: true
require 'rsolr'
module SunspotConnector
  class Connection
    def initialize(config = Config.new)
      raise ArgumentError, 'expected SunspotConnector::Config' unless config.is_a?(Config)
      @config = config
    end
  
    def connect(opts = {})
      RSolr::Client.new(build_connection, opts)
    end

    def build_connection
      Faraday.new do |conn|
        conn.headers = {
          'Keep-Alive' => 'timeout=10'
        }.merge(@config.headers)
        conn.adapter @config.adapter if @config.adapter
      end
    end
  end
end