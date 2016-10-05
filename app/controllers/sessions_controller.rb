class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    if user
      log_in(user)
      flash[:notice] = "Success!!!"
      redirect_to user_url(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
