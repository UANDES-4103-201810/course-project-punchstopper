class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :email
      t.string :password
      t.date :last_access
      t.boolean :role

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
