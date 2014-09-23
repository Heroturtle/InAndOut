class AddKindToEntries < ActiveRecord::Migration
  def change
  	add_column :entries, :kind, :string # => revenue // expense
  end
end
