require "application_system_test_case"

class BlogPostsTest < ApplicationSystemTestCase
  setup do
    @blog_post = blog_posts(:one)
  end

  test "visiting the index" do
    visit blog_posts_url
    assert_selector "h1", text: "Blog Posts"
  end

  test "creating a Blog post" do
    visit blog_posts_url
    click_on "New Blog Post"

    fill_in "Content", with: @blog_post.content
    fill_in "Feature image", with: @blog_post.feature_image
    fill_in "Name", with: @blog_post.name
    fill_in "Slug", with: @blog_post.slug
    click_on "Create Blog post"

    assert_text "Blog post was successfully created"
    click_on "Back"
  end

  test "updating a Blog post" do
    visit blog_posts_url
    click_on "Edit", match: :first

    fill_in "Content", with: @blog_post.content
    fill_in "Feature image", with: @blog_post.feature_image
    fill_in "Name", with: @blog_post.name
    fill_in "Slug", with: @blog_post.slug
    click_on "Update Blog post"

    assert_text "Blog post was successfully updated"
    click_on "Back"
  end

  test "destroying a Blog post" do
    visit blog_posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blog post was successfully destroyed"
  end
end
