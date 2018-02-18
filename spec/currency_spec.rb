require 'rspec'
require 'dotenv/load'

require_relative '../lib/currency.rb'


describe Currency do
  before (:all) do
    @api_client = Coinbase::Wallet::Client.new(api_key:    ENV['COINBASE_KEY'],
                                               api_secret: ENV['COINBASE_SECRET'],
                                               CB_VERSION: 'YYYY-MM-DD')
    @currency   = Currency.new(symbol: :BTC, api_client: @api_client)
  end

  describe '.initialize' do
    it 'raises an ArgumentError when a new currency is instantiated without a symbol' do
      expect { Currency.new(api_client: @api_client) }.to raise_error ArgumentError
    end

    it 'raises an ArgumentError if no coinbase client object is passed' do
      expect { Currency.new(symbol: :BTC) }.to raise_error ArgumentError
    end
    
    it 'returns a new object of type "Currency"' do
      expect(Currency.new(symbol: :BTC, api_client: @api_client)).to be_a_kind_of Currency
    end
  end

  describe '.symbol' do
    it 'returns a symbol' do
      expect(@currency.symbol).to be_a Symbol
    end

    it 'is one of :BTC, :LTC, :BCH, :ETH' do
      expect([:BTC, :LTC, :BCH, :ETH].include?(@currency.symbol)).to be true
    end
  end
  
  describe '.api_client' do
    it 'properly instantiates a coinbase client' do
      expect(@currency.api_client).to be_a Coinbase::Wallet::Client
    end

    it 'doesn\'t raise an error' do
      expect { @currency.api_client }.not_to raise_error
    end
  end
  
  describe '.account' do
    it 'returns a hash' do
      puts @currency.account
      expect(@currency.account).to be_a Hash
    end

    it 'has 11 keys' do
      puts @currency.account.keys.count
      expect(@currency.account.keys.count).to eql(11)
    end

    it 'matches the symbol' do
      puts @currency.symbol.to_s
      expect(@currency.symbol.to_s).to eq(@currency.account['currency'])
    end
  end
  
  xdescribe '.crypto_amount_in_wallet' do
    it '' do
    end
  end

  xdescribe '.usd_invested' do
  end

  xdescribe '#usd_lost' do
  end

  xdescribe '#usd_gained' do
  end

  xdescribe '#crypto_current_price_usd' do
  end

  xdescribe '#my_account_amount_usd' do
  end
  
  xdescribe '#positive_roi?' do

    context 'given a negative number' do
      it 'returns false' do
      end
    end

    context 'given a positive number' do
      it 'returns true do' do
      end
    end
    
  end

  xdescribe '#calc_roi' do
  end
end

