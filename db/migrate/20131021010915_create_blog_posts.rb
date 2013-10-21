class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :slug
      t.text :desc
      t.text :body
      t.boolean :history_flag

      t.timestamps
    end
  end
end
