class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :title
      t.text :body
      t.string :url
      t.integer :tool_id

      t.timestamps
    end
  end
end
