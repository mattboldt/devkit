class AddUrlToCategoryTable < ActiveRecord::Migration
  def change
  	add_column :categories, :url, :string
  end
end
