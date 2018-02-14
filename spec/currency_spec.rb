require 'rspec'
require_relative '../lib/currency.rb'

describe Currency do
  before (:all) do
    @currency = Currency.new(:BTC)
  end

  describe '.initialize' do
    it 'raises an ArgumentError when a new currency is instantiated without a symbol' do
      expect { Currency.new() }.to raise_error ArgumentError
    end
    it 'returns a new object of type "Currency"' do
      expect(Currency.new(:BTC)).to be_a_kind_of Currency
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
  
  xdescribe '.account' do

    it 'returns a hash' do
      expect(@currency.account).to be_a Hash
    end

    it '' do
      
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

