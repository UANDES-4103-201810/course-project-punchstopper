class CreateProjectFundings < ActiveRecord::Migration[5.1]
  def change
    create_table :project_fundings do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.references :project_promise, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
