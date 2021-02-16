# SunspotConnector

Ever wanted to override the default HTTP client used in RSolr? I have, and now you can too. If you put
Solr behind a reverse proxy that supports gzip you'll need additional headers and a better HTTP client
than the default to allow that. This gem provides hooks to make those changes. It also sets a keep-alive
header by default which can provide some nice performance improvements if you make a lot of small requests
and switch to a faraday adapter that supports it.

## Installation

```ruby
gem 'sunspot_connector'

# Optionally add a new faraday adapter
gem 'em-synchrony', '~> 1.0'
gem 'em-http-request', '~> 1.0'
```

In your Rails config:

```ruby
solr_override = SunspotConnector::Config.new
solr_override.headers = { 'Accept-Encoding' => 'gzip,deflate' } # send some extra headers with every request
solr_override.adapter = :em_synchrony # override the default http connector, any faraday adapter should do
config.solr_connection_overrides = solr_override
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mlh758/sunspot_connector.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
