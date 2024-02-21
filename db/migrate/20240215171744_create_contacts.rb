class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :company
      t.string :role
      t.timestamps
    end
  end
end
