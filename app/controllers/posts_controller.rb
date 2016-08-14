class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_blog, only: [:index, :new, :edit]

  # GET /posts
  # GET /posts.json
  def index
    @author_is_user = @blog.user == current_user
    @posts = @blog.posts.order(created_at: :desc)
  end

  # GET /posts/new
  def new
    @post = @blog.posts.new
  end

  # GET /posts/1/edit
  def edit
    authorize_user
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.blog_id = current_user.blog.id
    authorize_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to blog_posts_url(@post.blog), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html do 
          render :new, location: new_blog_post_url(@post.blog)
        end
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_user
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to blog_posts_url(@post.blog), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize_user
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url(@post.blog), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize_user
      redirect_to root_url, alert: "You're not authorized to do that." unless current_user && @post.blog == current_user.blog
    end

    def set_blog
      @blog = Blog.friendly.find(params[:blog_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :blog_id)
    end
end
