class RenameUrlToSlug < ActiveRecord::Migration
  def change
  	rename_column :codes, :url, :slug
  end
end
