class CreateVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :versions do |t|
      t.references :blog_post, null: false, foreign_key: true
      t.text :content
      t.integer :version_number

      t.timestamps
    end
  end
end
