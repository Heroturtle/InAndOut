class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table  :exchange_rates do |t|
    	t.string  :currency_code
    	t.date    :date
    	t.decimal :conversion_rate, precision: 10, scale: 6

      	t.timestamps
    end
  end
end
