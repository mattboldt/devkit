class AddCategoryIdToCode < ActiveRecord::Migration
  def change
  	add_column :codes, :category_id, :integer
  end
end
