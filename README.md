# bitcoin_bot


# Usage:

```ruby
#!/usr/bin/env ruby
require_relative './lib/currency.rb'
require 'coinbase/wallet'

api_client = Coinbase::Wallet::Client.new(api_key: ENV['COINBASE_KEY'],
                                      api_secret:  ENV['COINBASE_SECRET'])
btc    = Currency.new(symbol: :LTC, api_client: api_client)

puts "Bitcoin losses: $#{btc.usd_lost}"
puts "Bitcoin gains: $#{btc.usd_gained}"
    
```
