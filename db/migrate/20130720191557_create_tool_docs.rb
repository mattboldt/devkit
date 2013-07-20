class CreateToolDocs < ActiveRecord::Migration
  def change
    create_table :tool_docs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
