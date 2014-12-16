class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string  :item
      t.date    :purchase_date
      t.decimal :amount, precision: 12, scale: 2
      t.string  :currency_code
      t.date    :payment_date
      t.integer :payment_account_id
      t.text    :description
      t.integer :depreciation
      t.integer :category_id
      t.timestamps
    end
  end
end
