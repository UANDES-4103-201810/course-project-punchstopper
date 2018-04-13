class CreateProjectMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :project_media do |t|
      t.references :project, foreign_key: true
      t.string :link
      t.integer :link_type

      t.timestamps
    end
  end
end
