class PostsController < ApplicationController
  def index
    @vote = Vote.new
    @posts = Post.order(created_at: :desc)
  end

  def user_posts
    @vote = Vote.new
    @posts = Post.where(user_id: "#{current_user.id}").order(created_at: :desc)
  end

  def new
    @post = Post.new
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
