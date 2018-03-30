require "infocoin/version"
require 'coinbase/wallet'
require 'dotenv'

module Infocoin
  class Currency
    def initialize(symbol:, api_client:)
      raise ArgumentError 'Must specify currency symbol (BTC BCH LTC ETH)' if symbol.nil? || !([:BTC, :LTC, :BCH, :LTC].include?(symbol))
      raise ArgumentError 'Currency requires a valid coinbase client.' if api_client.nil? || api_client.class != Coinbase::Wallet::Client
      
      @symbol                   = symbol
      @api_client               = api_client
      @account                  = @api_client.account(symbol)
      @crypto_amount_in_wallet  = @account['balance']['amount']
      @usd_invested             = @account['native_balance']['amount']
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
      gain = self.current_cash_in_value - self.usd_invested
      if gain.negative? # i.e. $1.00 - $100.00 = -$99.00 means that $99.00 have been lost as profit, so return a $0.00 as a gain.
        return 0.0
      else
        return gain
      end
    end
  end
end
