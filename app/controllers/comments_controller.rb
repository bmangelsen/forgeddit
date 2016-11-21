class CommentsController < ApplicationController
  def post_comments
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: "#{@post.id}").order(created_at: :desc)
  end

  def user_comments
    @comments = Comment.where(user_id: "#{current_user.id}").order(created_at: :desc)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_comments_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to post_comments_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    Comment.find(params[:id]).destroy
    redirect_to post_comments_path(@post.id)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
