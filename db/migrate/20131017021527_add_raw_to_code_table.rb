class AddRawToCodeTable < ActiveRecord::Migration
  def change
  	add_column :codes, :raw, :text
  end
end
