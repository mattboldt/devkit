class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :title
      t.string :desc
      t.text :head
      t.text :body

      t.timestamps
    end
  end
end
