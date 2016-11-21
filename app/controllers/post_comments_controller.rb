class PostCommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = Comment.where(post_id: "#{@post.id}").order(created_at: :desc)
  end
end
