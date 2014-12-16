class Revenue < ActiveRecord::Base
  include DoesTransaction

  def self.permitted_params
  	%w[invoice_number category_id amount currency_code transaction_date payment_account_id payment_date description]
  end

  def as_blueprint
  	blueprint = attributes.slice(*self.class.permitted_params)
  	blueprint.merge('transaction_date' => Date.current)
  end
end