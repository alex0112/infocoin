#!/usr/bin/env ruby

require 'figaro'
require 'coinbase/wallet'

## TODO: make a new API key that doesn't have universal perms
API_KEY    = Figaro.env['coinbase_api_key']
API_secret = ENV['coinbase_api_secret']
p API_secret, API_KEY
client = Coinbase::Wallet::Client.new(api_key: API_KEY,
                                      api_secret: API_secret,
                                      CB_VERSION: 'YYYY-MM-DD')

account         = client.primary_account
balance         = account.balance
payment_methods = client.payment_methods
#socket          = Coinbase::Exchange::Websocket.new(keepalive: true)

puts account.transactions.to_json


client = Coinbase::Wallet::Client.new(api_key:    API_KEY,
                                      api_secret: API_secret)
btc = Currency.new(symbol: :BTC,
                   client: 'foo') 

## Show me how much money I've spent on a currency and, if I exchanged now how much money I would make.
# You've spent:
## If you cashed in now, you would make: 
