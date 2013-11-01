class ChangeUrlToSlug < ActiveRecord::Migration
  def change
  	rename_column :tools, :url, :slug
  end
end
