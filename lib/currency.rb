#!/usr/bin/env ruby
require 'coinbase/wallet'

class Currency
  def initialize(symbol)
    raise ArgumentError 'Must specify currency symbol (BTC BCH LTC ETH)' if symbol.nil? || !([:BTC, :LTC, :BCH, :LTC].include?(symbol))
    #    attr_reader: :symbol

    # @symbol                   = symbol
    # @api_client               = Coinbase::Wallet::Client.new(api_key:    ENV[coinbase_api_key],
    #                                                         api_secret: ENV[coinbase_api_secret],
    #                                                         CB_VERSION: '2018-02-08')
    # @account                  = @api_client.accounts[symbol]
    # @crypto_amount_in_wallet  = @account.balance
    # @usd_invested             = ''
    # @usd_lost                 = ''
    # @usd_gained               = ''
    # @crypto_current_usd_price = ''
    # @my_account_amound_usd    = ''
  end

  def crypto_amount_in_wallet
    # self.api_client.refresh!
    # return @account.balance
  end

  def usd_invested
#    return @usd_invested
  end

  def usd_gained
#    return @usd_gained
  end

  def usd_lost
#    return @usd_lost
  end

  def crypto_current_usd_price
#    return @crypto_current_usd_price
  end

  def my_account_amound_usd
#    return @my_account_amound_usd
  end
  

  def positive_roi?
    # roi = calc_roi()
    # roi.positive? ? return true : return false
  end
  
  def calc_roi
    #self.usd_invested - current_exchange_rate(self.symbol)
  end

  def current_exchange_rate
  end
end
