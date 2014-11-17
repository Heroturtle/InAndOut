# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
  	invoice_number		"4752829852"
    transaction_date   Date.parse("18.08.2014")
    amount 						3612.20           
    currency_code			"CHF"
    payment_date			"29.10.2014"
    description				"lorem ipsum und so"
    category
  end
end