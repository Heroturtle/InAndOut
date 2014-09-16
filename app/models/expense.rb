class Expense < ActiveRecord::Base
	belongs_to :category

  validates :category_id, :invoice_number, :amount, :currency_code, 
    :transaction_date, :payment_date, presence: true
  validates :currency_code, inclusion: { in: CURRENCY_CODES }

  def self.permitted_params
  	%w[invoice_number category_id amount currency_code transaction_date payment_date description]
  end

  def as_blueprint
  	blueprint = attributes.slice(*self.class.permitted_params)
  	blueprint.merge('transaction_date' => Date.current)
  end
end