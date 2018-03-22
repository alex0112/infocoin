#!/usr/bin/env ruby
require 'coinbase/wallet'
require 'dotenv'

class Currency
  def initialize(symbol:, api_client:)
    raise ArgumentError 'Must specify currency symbol (BTC BCH LTC ETH)' if symbol.nil? || !([:BTC, :LTC, :BCH, :LTC].include?(symbol))
    raise ArgumentError 'Currency requires a valid coinbase client.' if api_client.nil? || api_client.class != Coinbase::Wallet::Client
    
    @symbol                   = symbol
    @api_client               = api_client
    @account                  = @api_client.account(symbol)
    @crypto_amount_in_wallet  = @account['balance']['amount']
    @usd_invested             = @account['native_balance']['amount']
    @current_price            = ''
    # @usd_lost                 = ''
    # @usd_gained               = ''
    # @crypto_current_usd_price = ''
    # @my_account_amound_usd    = ''
  end

  def symbol
    return @symbol
  end

  def api_client
    return @api_client
  end

  def account
    account = self.api_client.account(self.symbol)
    account.refresh!
    return account
  end
  
  def crypto_amount_in_wallet
    return Float(self.account['balance']['amount'])
  end

  def usd_invested
    transactions   = self.account.transactions

   total_invested = transactions
                       .map { |t| t['native_amount']['amount'].to_f }
                       .reduce(:+)
    return Float(total_invested)
  end

  def current_cash_in_value
    Float(self.account['native_balance']['amount']) ## TODO: Use the buy/quote endpoint instead
  end

  def usd_lost
    loss = self.usd_invested - self.current_cash_in_value
    if loss.negative? # i.e. $1.00 - $10.00 = -$9.00 means that $9.00 have been made as profit, so return a $0.00 loss.
      return 0.0
    else
      return loss
    end
  end
  
  def usd_gained
#    return @usd_gained
  end

  def crypto_current_usd_price
#    return @crypto_current_usd_price
  end

  def my_account_amount_usd
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
