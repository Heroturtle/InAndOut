class CreatePaymentAccounts < ActiveRecord::Migration
  def change
    create_table :payment_accounts do |t|
      t.string :name
      t.string :account_number
      t.string :description
      t.string :text

      t.timestamps
    end
  end
end
