class PostsController < ApplicationController
  before_action :set_post, except: [ :index, :new, :create ]
  respond_to :html, :js

  def index
    @posts = current_user.posts.page(params[:page]).per(1)
    respond_with @posts
  end

  def show
    respond_with @post
  end

  def new
    @post = Post.new
    respond_with @post
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Your post was created" 
    end
    respond_with(@post)
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Your post was successfully updated."
    end
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post) do |format|
      format.html { redirect_to posts_url }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Use this method to whitelist the permissible parameters. Example: params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
