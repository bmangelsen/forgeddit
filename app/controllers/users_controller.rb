class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit_password
  end

  def update_password
    if user_params["password"] == "" || user_params["password_confirmation"] == ""
      @empty_field = "You left a field blank!"
      render :edit_password
    else
      current_user.update(user_params)
      if current_user.save
        redirect_to user_path(current_user.id)
      else
        render :edit_password
      end
    end
  end

  def edit
  end

  def update
    current_user.update(user_params)
    if current_user.save
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
