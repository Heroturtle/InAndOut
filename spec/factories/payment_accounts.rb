# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment_account do
    name "MyString"
    account_number "MyString"
    description "MyString"
    text "MyString"
  end
end
