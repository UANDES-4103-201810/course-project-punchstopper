class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :username

      t.timestamps
    end
    add_index :categories, :username, unique: true
  end
end
