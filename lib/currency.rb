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
