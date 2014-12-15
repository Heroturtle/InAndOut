class ExchangeRate < ActiveRecord::Base
  include DoesTransaction

  validates :currency_code, :date, :conversion_rate, presence: true
  validates :currency_code, inclusion: { in: CURRENCY_CODES }
  validates :date, uniqueness: { scope: :date }

  def self.for_currency (currency_code, date)
    exchange_rate = where(currency_code: currency_code, date: date).first!
    exchange_rate.conversion_rate
  end

	def self.retrieved_upates!
  end


end
