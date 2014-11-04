class PaymentAccount < ActiveRecord::Base
	has_many :revenues, dependent: :restrict_with_exception
	has_many :expense, dependent: :restrict_with_exception
	validates :name, presence: true

	def destroyable?
		# A category can only be destroyed if no expense is associated
		!Expense.exists?(payment_account_id: id)
	end

end
