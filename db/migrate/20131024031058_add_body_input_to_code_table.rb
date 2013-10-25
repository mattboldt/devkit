class AddBodyInputToCodeTable < ActiveRecord::Migration
  def change
  	add_column :codes, :body_input, :text
  end
end
