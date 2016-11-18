class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def user_posts
    @posts = Post.where("user_id = ?", current_user.id)
  end

  # @animals = Animal.where("name LIKE ? OR species LIKE ?", "%#{params['q']}%", "%#{params['q']}%")
end
