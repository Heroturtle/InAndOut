class CreateDepreciations < ActiveRecord::Migration
  def change
    create_table :depreciations do |t|

      t.timestamps
    end
  end
end
