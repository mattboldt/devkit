class AddBodyInputToBlog < ActiveRecord::Migration
  def change
  	add_column :blog_posts, :body_input, :text
  end
end
