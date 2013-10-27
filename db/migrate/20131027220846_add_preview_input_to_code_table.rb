class AddPreviewInputToCodeTable < ActiveRecord::Migration
  def change
  	add_column :codes, :preview_input, :text
  end
end
