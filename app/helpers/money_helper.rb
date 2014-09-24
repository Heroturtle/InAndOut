module MoneyHelper
	def money_amount(prefix, amount, currency)
		# kind = kind.to_s
		# raise "Unknown kind: #{kind}" unless %w[expense revenue].include?(kind)
		
		# case kind
		# when 'expense'
		# 	"- #{currency} #{amount.round(2)}"
		# when 'revenue'
		# 	"#{currency} #{amount.round(2)}"
		# end
		[prefix, currency, amount.round(2)].join(' ')
	end
end