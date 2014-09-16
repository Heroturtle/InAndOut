class PaymentAccount < ActiveRecord::Base
	has_many :expenses

end
