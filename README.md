# SunspotConnector

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/sunspot_connector`. To experiment with that code, run `bin/console` for an interactive prompt.

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

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sunspot_connector.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
