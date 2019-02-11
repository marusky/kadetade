class AddAdminUserIdToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :admin_user_id, :integer
  end
end
