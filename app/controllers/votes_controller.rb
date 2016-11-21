class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)

    unless Vote.find_by("user_id = ? and post_id = ?", current_user.id, @vote.post_id)
      @vote.save
    end

    redirect_to posts_path
  end

  def vote_params
    params.require(:vote).permit(:value, :user_id, :post_id)
  end
end
