module MoneyHelper
	def money_amount(amount, currency)
		"#{currency} #{amount.round(2)}"
	end	
end