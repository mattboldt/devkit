class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :tool_id
      t.timestamps
    end

    add_index :uploads, :tool_id
    add_attachment :uploads, :attachment
  end
end
