class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.boolean :outstanding
      t.text :description
      t.integer :goal_amount
      t.date :finish_date
      t.date :delivery_date


      t.timestamps
    end
  end
end
