class CreateDepreciations < ActiveRecord::Migration
  def change
    create_table :depreciations do |t|
      t.integer :asset_id
      t.date    :start_date
      t.date    :end_date
      t.decimal :amount, precision: 12, scale: 2
      t.integer :category_id
      t.timestamps
    end
  end
end
