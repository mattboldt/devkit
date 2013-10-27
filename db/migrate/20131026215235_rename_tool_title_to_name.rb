class RenameToolTitleToName < ActiveRecord::Migration
  def change
  	rename_column :dev_tools, :title, :name
  end
end
