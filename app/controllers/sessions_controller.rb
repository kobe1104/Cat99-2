class SessionsController < ApplicationController
  before_action :log_in?, only: [:new]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:username], user_params[:password])
    if user
      log_in(user)
      flash[:notice] = "Success!!!"
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid!"]
      render :new
    end
  end

  def destroy
    log_out(current_user)
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
