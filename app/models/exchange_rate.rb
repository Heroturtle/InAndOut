class ExchangeRate < ActiveRecord::Base
	validates :currency_code, :date, :conversion_rate, presence: true
	validates :currency_code, inclusion { in: CURRENCY_CODES }
	validates :date, uniqueness: { scope: :currency_code }

	def self.for_currency (currency_code, date)
		exchange_rate = where(currency_code: currency_code, date: date).first!
		exchange_rate.conversion_rate
	end
end
