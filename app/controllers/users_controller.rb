class UsersController < ApplicationController
  before_action :log_in?, only: [:new]

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show


  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
