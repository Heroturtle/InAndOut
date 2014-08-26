class Expense < ActiveRecord::Base
  validates :invoice_number, :amount, :currency_code, 
    :transaction_date, :payment_date, presence: true
  validates :currency_code, inclusion: { in: CURRENCY_CODES }
end

# class User < ActiveRecord::Base
# 	validates :email, presence: true, uniqueness: true
# end
