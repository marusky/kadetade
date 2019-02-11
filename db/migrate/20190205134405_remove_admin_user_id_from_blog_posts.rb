class RemoveAdminUserIdFromBlogPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :blog_posts, :admin_user_id, :integer
  end
end
