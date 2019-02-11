class AddAdminUserRefToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :blog_posts, :admin_user, foreign_key: true
  end
end
