class UserPostsController < ApplicationController
  def index
    @posts = Post.where(user_id: "#{current_user.id}").order(created_at: :desc)
  end
end
