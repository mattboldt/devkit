class DropTagsTable < ActiveRecord::Migration
  def change
  	drop_table :tags
  end
end
