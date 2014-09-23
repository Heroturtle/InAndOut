class AddPaymentAccountIdToEpxenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :payment_account_id, :integer
  end
end
