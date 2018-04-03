# Infocoin

Simple gem to abstract crytptocurrencies and return gains/losses.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'infocoin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install infocoin

## Usage

```ruby
#!/usr/bin/env ruby
require_relative './lib/currency.rb'
require 'coinbase/wallet'

api_client = Coinbase::Wallet::Client.new(api_key: ENV['COINBASE_KEY'],
                                      api_secret:  ENV['COINBASE_SECRET'])
btc    = Currency.new(symbol: :BTC, api_client: api_client)

puts "Bitcoin losses: $#{btc.usd_lost}"
puts "Bitcoin gains: $#{btc.usd_gained}"
    
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/infocoin.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
