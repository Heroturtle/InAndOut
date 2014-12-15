class CreatePrivateContacts < ActiveRecord::Migration
  def change
    create_table :private_contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email


      t.timestamps
    end
  end
end
