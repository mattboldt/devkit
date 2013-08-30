class AddColsToCode < ActiveRecord::Migration
  def change
  	add_column :codes, :preview, :text
  end
end
