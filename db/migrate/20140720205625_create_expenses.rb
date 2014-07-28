class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.string	:invoice_number
      t.decimal :amount, precision: 12, scale: 2
      t.string  :currency_code
      t.date    :transaction_date
    	t.date    :payment_date
    	t.text		:description

      t.timestamps
    end

    add_index :expenses, :transaction_date
  end
end
