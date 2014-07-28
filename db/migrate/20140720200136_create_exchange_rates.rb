class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table  :exchange_rates do |t|
    	t.string  :currency_code
    	t.date    :date
    	t.decimal :conversion_rate, precision: 12, scale: 6

      	t.timestamps
    end
    
    add_index :exchange_rates, [:currency_code, :date], unique: true
   	add_index :exchange_rates, :currency_code
   	add_index :exchange_rates, :date
  end
end
