module Blog
  class BlogPostsController < ApplicationController

    # GET /
    def index
      if params[:tag].present?
        @blog_posts = BlogPost.paginate(page: params[:page], per_page: 2).published.all.order('published_at DESC').tagged_with(params[:tag])
      else
        @blog_posts = BlogPost.paginate(page: params[:page], per_page: 2).published.all.order('published_at DESC') 
      end
    end

    # GET /friendly_id
    def show
      @blog_post = BlogPost.published.friendly.find(params[:id])
    end

   

  end
end
