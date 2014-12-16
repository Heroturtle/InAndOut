module DoesTransaction
  as_trait do

  belongs_to :category
  belongs_to :payment_account

  validates :invoice_number, :amount, :transaction_date, 
    :payment_date, :category_id, presence: true
  validates :currency_code, presence: true, 
    inclusion: { in: CURRENCY_CODES }
  end
end 