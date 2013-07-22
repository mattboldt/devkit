class AddCategoryIdToTools < ActiveRecord::Migration
  def change
  	add_column :tools, :category_id, :integer
  end
end
