class PaymentAccount < ActiveRecord::Base
	has_many :entries
	validates :name, presence :true

end
