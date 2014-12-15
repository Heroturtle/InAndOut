class Expense < ActiveRecord::Base
  include DoesTransaction
  
  belongs_to :category
  belongs_to :payment_account

  validates :invoice_number, :amount, :transaction_date, 
    :payment_date, :category_id, presence: true
  validates :currency_code, presence: true, 
    inclusion: { in: CURRENCY_CODES }

  acts_as_paranoid

  mount_uploader :receipt, ReceiptUploader
  
  def self.permitted_params
  	%w[invoice_number category_id amount currency_code transaction_date payment_account_id payment_date description receipt remove_receipt]
  end

  def as_blueprint
  	blueprint = attributes.slice(*self.class.permitted_params)
  	blueprint.merge('transaction_date' => Date.current)
  end

  def self.to_csv
    CSV.generate(encoding: 'UTF-8') do |csv|
      csv << ["No.", "Datum", "Beschreibung", "Währung", "Betrag"]
      all.each do |expense|
        csv << [expense.id, expense.payment_date, expense.description, expense.currency_code, expense.amount] 
      end
    end
  end
end
