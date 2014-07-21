class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
    	t.string	:reference
    	t.date		:transaction_date
    	t.integer	:lc_amount
    	t.integer	:chf_amount
    	t.date    	:payment_date
    	t.text		:comments

      	t.timestamps
    end
  end
end
