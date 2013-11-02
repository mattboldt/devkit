class ChangeToolDescToText < ActiveRecord::Migration
  def change
  	change_column :tools, :desc, :text
  end
end
