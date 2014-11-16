class AddDeletedAtToRevenues < ActiveRecord::Migration
  def change
    add_column :revenues, :deleted_at, :datetime
    add_index :revenues, :deleted_at
  end
end
