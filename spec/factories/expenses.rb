# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
  	invoice_number		"4752829852"
    amount 						"3612.20"           
    currency_code			"CHF"
    transaction_date 	"18.08.2014"
    payment_date			"29.10.2014"
    description				"lorem ipsum und so"
  end
end
