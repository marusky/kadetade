module AdminUsers
  class BlogPostsController < AdminUserController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy, :publish, :unpublish]
    before_action :authenticate_admin_user!

    # GET /blog_posts
    # GET /blog_posts.json
    def index
      @blog_posts = current_admin_user.blog_posts
    end

    # GET /blog_posts/1
    # GET /blog_posts/1.json
    def show
    end

    # GET /blog_posts/new
    def new
      @blog_post = current_admin_user.blog_posts.build
    end

    # GET /blog_posts/1/edit
    def edit
    end

    def publish
      @blog_post.update(published: true, published_at: Time.now)
      redirect_to admin_users_blog_posts_url
    end

    def unpublish
      @blog_post.update(published: false, published_at: nil)
      redirect_to admin_users_blog_posts_url
    end

    def create
      @blog_post = current_admin_user.blog_posts.build(blog_post_params)
      respond_to do |format|
        if @blog_post.save
          format.html { redirect_to admin_users_blog_post_path(@blog_post), notice: 'Blog post was successfully created.' }
          format.json { render :show, status: :created, location: @blog_post }
        else
          format.html { render :new }
          format.json { render json: @blog_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blog_posts/1
    # PATCH/PUT /blog_posts/1.json
    def update
      respond_to do |format|
        if @blog_post.update(blog_post_params)
          format.html { redirect_to admin_users_blog_post_path(@blog_post), notice: 'Blog post was successfully updated.' }
          format.json { render :show, status: :ok, location: @blog_post }
        else
          format.html { render :edit }
          format.json { render json: @blog_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blog_posts/1
    # DELETE /blog_posts/1.json
    def destroy
      @blog_post.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_blog_posts_url, notice: 'Blog post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_blog_post
        @blog_post = current_admin_user.blog_posts.friendly.find(params[:id]) # hlada medzi postami, ktore maju admin_user_id = 1 taky, ktory ma friendly_id napr "hej"
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def blog_post_params
        params.require(:blog_post).permit(:name, :content, :feature_image, :tag_list)
      end
  end
end