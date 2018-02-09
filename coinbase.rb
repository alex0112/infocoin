#!/usr/bin/env ruby
require 'coinbase/wallet'

## TODO: make a new API key that doesn't have universal perms
API_KEY    = ENV[COINBASE_KEY]
API_secret = ENV[COINBASE_SECRET]

client = Coinbase::Wallet::Client.new(api_key: API_KEY,
                                      api_secret: API_secret,
                                      CB_VERSION: 'YYYY-MM-DD')

account         = client.primary_account
balance         = account.balance
payment_methods = client.payment_methods
#socket          = Coinbase::Exchange::Websocket.new(keepalive: true)

puts account.transactions.to_json

class Currency
  def initialize(symbol, client)
    raise ArgumentError 'Must specify currency symbol (BTC BCH LTC ETH)' if nil? symbol
    raise ArgumentError 'Must specify currency symbol (BTC BCH LTC ETH)' if nil? client

    attr_accessor :usd_invested
    @usd_invested = 5 #client
  end

  def positive_roi?
    roi = calc_roi()
    roi.positive? ? true : false
  end

  def calc_roi
    currency = self.currency
    return self.usd_invested - current_exchange_rate(self.symbol)
  end

end

client = Coinbase::Wallet::Client.new(api_key:    API_KEY,
                                      api_secret: API_secret)
btc = Currency.new(symbol: :BTC,
                   client: 'foo') 

## Show me how much money I've spent on a currency and, if I exchanged now how much money I would make.
# You've spent:
## If you cashed in now, you would make: 
