class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :name
      t.text :content
      t.string :feature_image
      t.string :slug

      t.timestamps
    end
    add_index :blog_posts, :slug, unique: true
  end
end
