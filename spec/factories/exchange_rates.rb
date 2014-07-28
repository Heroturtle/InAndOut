# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exchange_rate do
  	currency_code 'EUR'
  	date Date.current
  	conversion_rate 1.5
  end
end