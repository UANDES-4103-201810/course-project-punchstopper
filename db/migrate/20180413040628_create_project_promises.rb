class CreateProjectPromises < ActiveRecord::Migration[5.1]
  def change
    create_table :project_promises do |t|
      t.references :project, foreign_key: true
      t.text :description
      t.integer :cost

      t.timestamps
    end
  end
end
