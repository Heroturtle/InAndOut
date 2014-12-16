class Asset < ActiveRecord::Base
  belongs_to :category
  belongs_to :payment_account
  
  DEPRECIATION_YEARS = ['1', '2', '3', '4', '5']

  def self.permitted_params
    %w[item purchase_date amount currency_code payment_date payment_account_id description depreciation category_id]
  end

  def as_blueprint
    blueprint = attributes.slice(*self.class.permitted_params)
    blueprint.merge('transaction_date' => Date.current)
  end
end
