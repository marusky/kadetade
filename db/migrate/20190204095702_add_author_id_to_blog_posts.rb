class AddAuthorIdToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :blog_posts, :author_id, :integer
    add_index :blog_posts, :author_id
  end
end
