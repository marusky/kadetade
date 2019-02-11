class RemoveAuthorIdFromBlogPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :blog_posts, :author_id, :integer
  end
end
