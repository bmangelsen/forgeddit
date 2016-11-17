class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authorize!(params[:password])
      session["current_user_id"] = @user.id
      redirect_to posts_path
    else
      @error = "Wrong password/username combo!"
      render :new
    end
  end

  def destroy
    session.delete("current_user_id")
    redirect_to posts_path
  end
end
