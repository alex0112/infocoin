require 'rspec'
require_relative '../lib/currency.rb'

describe Currency do
  before (:all) do
    VCR.use_cassette('client_and_currency') do
      @api_client = Coinbase::Wallet::Client.new(api_key:    ENV['COINBASE_KEY'],
                                                 api_secret: ENV['COINBASE_SECRET'])
      @currency   = Currency.new(symbol: :BTC, api_client: @api_client)
    end
  end

  describe '#initialize' do
    it 'raises an ArgumentError when a new currency is instantiated without a symbol' do
      expect { Currency.new(api_client: @api_client) }.to raise_error ArgumentError
    end

    it 'raises an ArgumentError if no coinbase client object is passed' do
      expect { Currency.new(symbol: :BTC) }.to raise_error ArgumentError
    end

    it 'returns a new object of type "Currency"' do
      VCR.use_cassette('currency_init') do
        expect(Currency.new(symbol: :BTC, api_client: @api_client)).to be_a_kind_of Currency
      end
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
        VCR.use_cassette('account_hash') do
          expect(@currency.account).to be_a Hash
        end
      end
      
      it 'has 11 keys' do
        VCR.use_cassette('account_hash') do
          expect(@currency.account.keys.count).to eql(11)
        end
      end
      
      it 'matches the symbol' do
        VCR.use_cassette('account_hash') do
          expect(@currency.symbol.to_s).to eq(@currency.account['currency'])
        end
      end
  end

  describe '.crypto_amount_in_wallet' do
    it 'is a float' do
      VCR.use_cassette('crypto_amount_in_wallet') do
        expect(@currency.crypto_amount_in_wallet).to be_a Float
      end
    end
  end

  describe '.usd_invested' do
    it 'is a float' do
      VCR.use_cassette('account') do
        expect(@currency.usd_invested).to be_a Float
      end
    end
  end

  describe '.current_cash_in_value' do
    it 'is a float' do
      VCR.use_cassette('current_cash_in_val') do
        expect(@currency.current_cash_in_value).to be_a Float
      end
    end
  end

  
  xdescribe '#usd_lost' do
  end

  xdescribe '.usd_gained' do
  end

  xdescribe '.crypto_current_price_usd' do
  end

  xdescribe '.my_account_amount_usd' do
  end

  xdescribe '.positive_roi?' do

    context 'given a negative number' do
      it 'returns false' do
      end
    end

    context 'given a positive number' do
      it 'returns true do' do
      end
    end

  end

  xdescribe '.calc_roi' do
  end
end
