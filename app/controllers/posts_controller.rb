class PostsController < ApplicationController
  before_action :find_post, :set_nav_identifier
  authorize_resource
  before_action :create_access_log

  def index
    # Task 2
    @posts = Post.accessible_by(current_ability)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(author: current_user)

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    @post.author = current_user
    
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def search
    @current_nav_identifier = :search
  end

  def search_result
    # Task 3
    @posts = Post.where(title: params[:search][:title], private_post: false)
  end


  private
    def find_post
      @post = Post.find(params[:id]) if params[:id]
    end

    def post_params
      # Task 6
      params.require(:post).permit(:title, :content, :private_post)
    end

    def set_nav_identifier
      @current_nav_identifier = :posts
    end

    def create_access_log
      PageView.create(controller_name: controller_name, controller_action: action_name, user: current_user, resource_id: params[:id])
    end
end
