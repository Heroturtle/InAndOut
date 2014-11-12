class AddDeletedAtToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :deleted_at, :datetime
  end
end
