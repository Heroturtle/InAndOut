class RenameExpensesToEntries < ActiveRecord::Migration
  def change
  	rename_table :expenses, :entries
  end
end
