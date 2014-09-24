class Entry < ActiveRecord::Base
	belongs_to :category

  validates :invoice_number, :amount, :currency_code, 
    :transaction_date, :payment_date, presence: true
  # validates :category_id, presence: true
  validates :currency_code, inclusion: { in: CURRENCY_CODES }
  
  assignable_values_for :kind do
    ['expense', 'revenue']
  end

  def self.permitted_params
  	%w[invoice_number category_id amount currency_code transaction_date payment_date description]
  end

  def as_blueprint
  	blueprint = attributes.slice(*self.class.permitted_params)
  	blueprint.merge('transaction_date' => Date.current)
  end

  def expense?
    kind == 'expense'
  end 

  def revenue?
    kind == 'revenue'
  end
end