class AddIndexToExchangeRatesCurrencyCodeDate < ActiveRecord::Migration
  def change
  	add_index :exchange_rates, [:currency_code, :date]
  end
end
