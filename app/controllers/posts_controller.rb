class PostsController < ApplicationController
  include PostsHelper
  def index
    @posts = Post.order(created_at: :desc)
  end

  def user_posts
    @posts = Post.where(user_id: "#{current_user.id}").order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    if url_exist?(@post.link)
      redirect_to @post.link
    else
      redirect_to "http://www.nooooooooooooooo.com/"
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:name, :link, :user_id)
  end
end
