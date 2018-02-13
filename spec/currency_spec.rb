require 'rspec'
require_relative '../lib/currency.rb'

describe Currency do
  describe '.initialize' do
    it 'raises an ArgumentError when a new currency is instantiated without a symbol' do
    end
    it 'returns a new object of type "Currency"' do
    end
  end

  describe '.crypto_amount_in_wallet' do
  end

  describe '.usd_invested' do
  end

  describe '#usd_lost' do
  end

  describe '#usd_gained' do
  end

  describe '#crypto_current_price_usd' do
  end

  describe '#my_account_amount_usd' do
  end
  
  describe '#positive_roi?' do

    context 'given a negative number' do
      it 'returns false' do
      end
    end

    context 'given a positive number' do
      it 'returns true do' do
      end
    end
    
  end

  describe '#calc_roi' do
  end
end

