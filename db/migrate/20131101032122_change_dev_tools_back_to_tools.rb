class ChangeDevToolsBackToTools < ActiveRecord::Migration
  def change
  	rename_table :dev_tools, :tools
  end
end
