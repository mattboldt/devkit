class AddUrlToCodeTable < ActiveRecord::Migration
  def change
  	add_column :codes, :url, :string
  end
end
