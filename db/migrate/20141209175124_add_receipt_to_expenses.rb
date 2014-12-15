class AddReceiptToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :receipt, :string
  end
end
