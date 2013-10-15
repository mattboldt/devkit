class AddIndexToSlug < ActiveRecord::Migration
  def change
  	add_index :codes, :slug
  end
end
