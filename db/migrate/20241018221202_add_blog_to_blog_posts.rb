class AddBlogToBlogPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :blog_posts, :blog, null: false, foreign_key: true
  end
end
