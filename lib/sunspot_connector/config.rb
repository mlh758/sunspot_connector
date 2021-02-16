# frozen_string_literal: true

module SunspotConnector
  # Config lets you add additional headers to solr requests
  # and change the Faraday adapter RSolr is using
  class Config
    attr_accessor :headers, :adapter
    def initialize
      @headers = {}
    end
  end
end