class CreateRevenue < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
			t.string	:invoice_number
      t.decimal :amount, precision: 12, scale: 2
      t.string  :currency_code
      t.date    :transaction_date
    	t.date    :payment_date
    	t.text		:description
    	t.integer	:category_id

      t.timestamps
    end

    add_index :revenues, :transaction_date
  end
end