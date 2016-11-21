class UserCommentsController < ApplicationController
  def index
    @comments = Comment.where(user_id: "#{current_user.id}").order(created_at: :desc)
  end
end
