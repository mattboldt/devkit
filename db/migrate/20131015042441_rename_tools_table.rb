class RenameToolsTable < ActiveRecord::Migration
  def change
  	rename_table :tools, :dev_tools
  end
end
